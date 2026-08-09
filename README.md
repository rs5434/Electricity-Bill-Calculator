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
```

## Program Strcuture
```text
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
```
## 🧠 Algorithm

1. **Start the program.**
2. **Initialize the data segment.**
3. **Display the project title.**
4. **Ask the user to enter electricity units.**
5. **Read the units digit by digit.**
6. **Convert ASCII digits into numerical values.**
7. **Check the number of units.**
8. **If units ≤ 100:**
   - `Bill = Units × 2`
9. **Else if units ≤ 200:**
   - `First 100 units = ₹200`
   - `Remaining units = Units - 100`
   - `Remaining charge = Remaining × ₹3`
   - `Bill = ₹200 + Remaining charge`
10. **Else:**
    - `First 100 units = ₹200`
    - `Next 100 units = ₹300`
    - `Remaining units = Units - 200`
    - `Remaining charge = Remaining × ₹5`
    - `Bill = ₹200 + ₹300 + Remaining charge`
11. **Convert the calculated bill into printable digits.**
12. **Display the final bill.**
13. **Exit the program.**
    
## 📚 Concepts Used

Through this project, the following concepts were practiced:
```text
8086 Assembly Language
Registers
Memory variables
ASCII conversion
Keyboard input
Screen output
Arithmetic operations
Conditional branching
Loops
Procedures
Stack operations
DOS interrupts
Number conversion
Slab-based decision making
```
## ⭐ Conclusion

The Electricity Bill Calculator using 8086 Assembly Language is a simple real-world application that demonstrates how basic microprocessor instructions can be used to solve a practical problem.

The project combines:
```text
User Input
    ↓
ASCII Conversion
    ↓
Number Processing
    ↓
Conditional Checking
    ↓
Arithmetic Calculation
    ↓
Number-to-ASCII Conversion
    ↓
Output
```
