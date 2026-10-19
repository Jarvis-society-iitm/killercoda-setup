/**
 * Mock Verification & Leaderboard Server
 * Mimics Next.js / Supabase backend endpoints:
 *   - POST /api/labs/verify
 *   - POST /api/labs/complete
 *
 * Usage:
 *   node mock-server/server.js
 *   or PORT=4000 node mock-server/server.js
 */

const http = require('http');

const PORT = process.env.PORT || 4000;

// Sample in-memory student database
const STUDENTS = {
  '21f1001230': { name: 'Aditya Kumar', token: 'valid-token-123', completedLabs: [] },
  '22f2000456': { name: 'Priya Sharma', token: 'valid-token-456', completedLabs: ['linux-basics-101'] },
  'guest-roll': { name: 'Guest Tester', token: 'guest-pass', completedLabs: [] },
};

const server = http.createServer((req, res) => {
  const url = req.url;
  const method = req.method;

  if (method === 'POST') {
    let body = '';
    req.on('data', chunk => {
      body += chunk.toString();
    });

    req.on('end', () => {
      let data = {};
      try {
        if (body) data = JSON.parse(body);
      } catch (e) {
        res.writeHead(400, { 'Content-Type': 'application/json' });
        return res.end(JSON.stringify({ success: false, message: 'Invalid JSON payload' }));
      }

      // Endpoint: /api/labs/verify
      if (url === '/api/labs/verify') {
        const { student_id, lab_slug, auth_token } = data;

        if (!student_id || !auth_token) {
          res.writeHead(400, { 'Content-Type': 'application/json' });
          return res.end(JSON.stringify({
            success: false,
            message: 'student_id and auth_token are required'
          }));
        }

        const student = STUDENTS[student_id];
        if (!student || student.token !== auth_token) {
          res.writeHead(401, { 'Content-Type': 'application/json' });
          return res.end(JSON.stringify({
            success: false,
            message: 'Invalid credentials or unauthorized student ID.'
          }));
        }

        const alreadyCompleted = student.completedLabs.includes(lab_slug);

        if (alreadyCompleted) {
          res.writeHead(200, { 'Content-Type': 'application/json' });
          return res.end(JSON.stringify({
            success: true,
            mode: 'practice',
            student_name: student.name,
            message: 'Lab already completed. Entering Practice Mode (no repeat XP).',
            session_token: `sess-pract-${student_id}-${Date.now()}`
          }));
        }

        res.writeHead(200, { 'Content-Type': 'application/json' });
        return res.end(JSON.stringify({
          success: true,
          mode: 'active',
          student_name: student.name,
          message: 'Student verified successfully. XP eligible!',
          session_token: `sess-active-${student_id}-${Date.now()}`
        }));
      }

      // Endpoint: /api/labs/complete
      if (url === '/api/labs/complete') {
        const { student_id, lab_slug, session_token } = data;

        if (!student_id || !session_token) {
          res.writeHead(400, { 'Content-Type': 'application/json' });
          return res.end(JSON.stringify({
            success: false,
            message: 'Missing submission fields'
          }));
        }

        const student = STUDENTS[student_id];
        if (!student) {
          res.writeHead(404, { 'Content-Type': 'application/json' });
          return res.end(JSON.stringify({
            success: false,
            message: 'Student record not found.'
          }));
        }

        if (!student.completedLabs.includes(lab_slug)) {
          student.completedLabs.push(lab_slug);
        }

        res.writeHead(200, { 'Content-Type': 'application/json' });
        return res.end(JSON.stringify({
          success: true,
          xp_awarded: 200,
          total_xp: 650,
          rank: 7,
          message: `Awesome work, ${student.name}! Your XP has been recorded.`
        }));
      }

      res.writeHead(404, { 'Content-Type': 'application/json' });
      res.end(JSON.stringify({ error: 'Endpoint not found' }));
    });
  } else if (method === 'GET' && url === '/health') {
    res.writeHead(200, { 'Content-Type': 'application/json' });
    res.end(JSON.stringify({ status: 'ok', server: 'Jarvis Linux Club Mock API' }));
  } else {
    res.writeHead(404, { 'Content-Type': 'application/json' });
    res.end(JSON.stringify({ error: 'Not found' }));
  }
});

server.listen(PORT, () => {
  console.log(`[Jarvis Mock Server] Running at http://localhost:${PORT}`);
  console.log(`Ready for /api/labs/verify and /api/labs/complete testing.`);
});

