<img width="1920" height="1020" alt="Screenshot 2025-10-31 230423" src="https://github.com/user-attachments/assets/9b04c696-f238-4054-8188-f15899ad71cd" />

# 32-bit ALU in Verilog

### 📘 Overview

This project implements a **32-bit Arithmetic Logic Unit (ALU)** using **Verilog HDL**.
The ALU is capable of performing a wide range of arithmetic and logical operations, controlled through **enable (EN)** and **select (SEL)** signals for dynamic operation selection.

---

### ⚙️ Features

* **Arithmetic Operations**

  * Addition (using CLA for faster computation)
  * Subtraction
  * Multiplication (Booth’s algorithm)
  * Division

* **Logical Operations**

  * AND, OR, NOR, NAND, XOR, XNOR, NOT

* **Shift & Comparison**

  * Logical Shift Left / Right
  * Equality and Greater-than comparison

* **Flags**

  * Carry Flag
  * Zero Flag
  * Overflow Flag
  * Parity Flag

* **Control Signals**

  * **Enable (EN):** Activates the ALU operation
  * **Select (SEL):** Determines which operation is executed

---

### 🧩 Design Structure

```
32_bit_ALU/
│
├── rtl/                # Verilog source files
│   ├── alu.v
│   ├── add.v
│   ├── sub.v
│   ├── mul.v
│   ├── div.v
│   ├── and.v
│   ├── or.v
│   ├── xor.v
│   ├── ...
│
├── tb/                 # Testbench files
│   ├── alu_tb.v
│
└── README.md           # Project documentation
```
