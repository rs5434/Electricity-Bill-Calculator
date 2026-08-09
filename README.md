# ⚡ Electricity Bill Calculator using 8086 Assembly

A simple **Electricity Bill Calculator** implemented in **8086 Assembly Language** using **EMU8086**.

The program accepts the number of electricity units consumed and calculates the electricity bill based on different unit slabs.

This project is designed as a beginner-friendly introduction to **8086 Assembly Language**, conditional branching, arithmetic operations, keyboard input, number conversion, and DOS interrupts.

---

## 📌 Project Overview

The Electricity Bill Calculator takes the number of units consumed by the user and calculates the total electricity bill according to the following rates:

| Units Consumed | Rate |
|----------------|------|
| 0 - 100 | ₹2 per unit |
| 101 - 200 | ₹3 per unit |
| Above 200 | ₹5 per unit |

The calculation is performed progressively.

For example, if the user consumes **250 units**:

- First 100 units → `100 × ₹2 = ₹200`
- Next 100 units → `100 × ₹3 = ₹300`
- Remaining 50 units → `50 × ₹5 = ₹250`

Therefore:



```text
Total Bill = ₹200 + ₹300 + ₹250
           = ₹750


##Prigram Strcuture
MAIN
│
├── Display title
│
├── Display input message
│
├── READ_NUMBER
│   └── Read multi-digit units
│
├── LOW
│   └── Calculate bill for 0–100 units
│
├── MEDIUM
│   └── Calculate bill for 101–200 units
│
├── HIGH
│   └── Calculate bill for >200 units
│
├── DISPLAY
│   └── Display final bill
│
├── PRINT_NUMBER
│   └── Convert number to ASCII
│
└── Exit
