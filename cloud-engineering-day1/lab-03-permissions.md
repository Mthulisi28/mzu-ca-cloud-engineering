# Lab 3 — Linux File Permissions

## MZ-UCA Cloud Engineering

### Objective

Understand how Linux controls access to files using read, write, and execute permissions.

This lab demonstrates how permissions affect:

- Reading files
- Writing to files
- Executing scripts
- Troubleshooting permission errors
- Applying least-privilege principles

---

## 1. Understanding Linux Permissions

Linux represents file permissions using three permission groups:

- Owner
- Group
- Others

The three basic permissions are:

- r — read
- w — write
- x — execute

Example:

    -rwxr-xr-x

This represents:

    Owner  → rwx
    Group  → r-x
    Others → r-x

The numeric permission values are:

    r = 4
    w = 2
    x = 1

Therefore:

    7 = 4 + 2 + 1 = rwx
    5 = 4 + 1     = r-x

---

## 2. Permission 600

A test file was created:

    touch permissions-test.txt

Permissions were set to:

    chmod 600 permissions-test.txt

Verified result:

    -rw-------

Permission 600 gives the owner read and write access while denying access to the group and others.

The file was successfully written to and read.

---

## 3. Permission 400

The file was changed to:

    chmod 400 permissions-test.txt

Verified result:

    -r--------

The file could still be read.

When we attempted to modify it:

    echo "Trying to modify this file." > permissions-test.txt

Linux returned:

    bash: permissions-test.txt: Permission denied

This demonstrated that read permission does not provide write permission.

---

## 4. Permission 755

The file was changed to:

    chmod 755 permissions-test.txt

Verified result:

    -rwxr-xr-x

Permission 755 means:

    Owner  → rwx
    Group  → r-x
    Others → r-x

---

## 5. Execute Permission

A shell script was created:

    nano execute-test.sh

The script contained:

    #!/bin/bash

    echo "MZ-UCA Cloud Engineering: execute permission works."

Initially the script had:

    -rw-rw-r--

There was no execute permission.

Running:

    ./execute-test.sh

produced:

    bash: ./execute-test.sh: Permission denied

Execute permission was then added:

    chmod +x execute-test.sh

The script was successfully executed and produced:

    MZ-UCA Cloud Engineering: execute permission works.

---

## 6. chmod +x vs chmod 755

chmod +x adds execute permission while preserving the existing permission settings.

Example:

    chmod +x execute-test.sh

chmod 755 explicitly sets:

    rwxr-xr-x

Example:

    chmod 755 execute-test.sh

These commands are therefore not always equivalent.

---

## 7. Troubleshooting Lesson

The permission error was investigated systematically:

1. Inspect the permissions with ls -l.
2. Identify the missing execute permission.
3. Add execute permission with chmod +x.
4. Verify the permission change.
5. Execute the script again.
6. Confirm successful execution.

Engineering process:

    Observe
    → Identify
    → Change
    → Verify
    → Test

---

## 8. Cloud Engineering Connection

Linux permissions are an important foundation for cloud engineering.

A Linux-based cloud server can involve multiple layers of access control:

    Network
       ↓
    Security Group / Firewall
       ↓
    User Authentication
       ↓
    Linux Permissions
       ↓
    Process
       ↓
    Application
       ↓
    Files and Resources

Understanding Linux permissions helps engineers reason about why a user or process can or cannot access a resource.

This connects to the security principle of least privilege.

---

## 9. Engineering Evidence

Verified during this lab:

- chmod 600 allowed owner read/write access.
- chmod 400 restricted the file to owner read access.
- Writing to a 400 file produced Permission denied.
- A shell script without execute permission produced Permission denied.
- chmod +x enabled execution.
- The script executed successfully after the permission change.
- chmod 755 produced rwxr-xr-x.

---

## 10. Key Takeaways

1. Linux permissions control access to files.
2. r means read.
3. w means write.
4. x means execute.
5. 600 means owner read/write only.
6. 400 means owner read only.
7. 755 means owner read/write/execute and group/others read/execute.
8. chmod +x adds execute permission.
9. ls -l is essential for inspecting permissions.
10. Permission errors should be investigated rather than blindly overridden.

### MZ-UCA Engineering Principle

Learn → Demonstrate → Build → Modify → Break → Troubleshoot → Verify → Document → Explain
