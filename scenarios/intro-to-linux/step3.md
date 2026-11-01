# Step 3: Hands-On Practice 2 — Create, Duplicate & Move

In this step, you will practice directory creation (`mkdir`), creating empty files (`touch`), copying (`cp`), and moving/renaming (`mv`) exactly as outlined in Slide 14.

### Background & Concepts:
- `mkdir [name]`: Creates a directory. (Flag `-p` creates missing parent directories automatically).
- `touch [file]`: Creates an empty file or updates timestamps without modifying contents.
- `cp [source] [dest]`: Duplicates a file. (Flag `-r` is required to copy folders recursively).
- `mv [source] [dest]`: Moves a file/folder, or renames it if moved to the same directory.
- `tree`: Displays the resulting hierarchy.

---

### Tasks:
Execute the exact sequence from your home directory (`cd ~`):

1. Create a directory named `sandbox`:
   ```bash
   cd ~
   mkdir sandbox
   ```
2. Move inside the `sandbox` directory:
   ```bash
   cd sandbox
   ```
3. Create an empty file named `data.csv`:
   ```bash
   touch data.csv
   ```
4. Duplicate `data.csv` and name the copy `backup.csv`:
   ```bash
   cp data.csv backup.csv
   ```
5. Create a new directory inside `sandbox` called `archive`:
   ```bash
   mkdir archive
   ```
6. Move `backup.csv` into the `archive` directory:
   ```bash
   mv backup.csv archive/
   ```
7. Verify your structure with `tree`:
   ```bash
   tree ~/sandbox
   ```

### Expected Directory Layout:
```text
sandbox
|-- archive/
|   `-- backup.csv
`-- data.csv
```

Click **Verify** once your `sandbox` structure matches the diagram above!
