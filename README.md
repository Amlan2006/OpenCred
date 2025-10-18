# 🧾 Certification Smart Contract

## Overview
The **Certification** smart contract enables employers to issue and verify certificates securely on the blockchain.  
Only the **owner** of the contract can register new employers, and only registered employers can issue certificates — ensuring authenticity and preventing forgery.

---

## ⚙️ Features
- 🔒 **Owner-based access control** — Only the deployer can register employers.  
- 🧑‍💼 **Employer registration** — Add employers using a unique ID and name.  
- 🎓 **Certificate issuance** — Registered employers can issue certificates to individuals.  
- 🔍 **Certificate verification** — Anyone can verify the validity of a certificate.  
- 📜 **Certificate retrieval** — Fetch details such as the holder’s name, course, and issue date.

---

## 🧩 Smart Contract Details
- **Solidity Version:** `0.8.24`  
- **License:** `MIT`  

---

## 📦 Data Structures

### `struct infoCertificate`
| Field | Type | Description |
|--------|------|-------------|
| `name` | `string` | Name of the certificate holder |
| `course` | `string` | Name of the course or program |
| `dateOfIssue` | `string` | Date of certificate issuance |
| `certificationId` | `uint256` | Unique certificate identifier |

---

## 🔐 Modifiers

| Modifier | Description |
|-----------|-------------|
| `onlyOwner` | Restricts access to the contract owner |
| `onlyEmployer(uint256 employerId)` | Restricts access to registered employers |

---

## 🧠 Functions

### `constructor()`
Initializes the contract and sets the deployer as the **owner**.

---

### `registerEmployer(uint256 employerId, string memory name)`
Registers a new employer.  
**Access:** `onlyOwner`

**Parameters:**
- `employerId`: Unique ID for the employer  
- `name`: Employer’s name  

---

### `addCertificate(uint256 certificationId, uint256 employerId, string memory name, string memory course, string memory dateOfIssue)`
Issues a new certificate to an individual.  
**Access:** `onlyEmployer(employerId)`

**Parameters:**
- `certificationId`: Unique ID for the certificate  
- `employerId`: ID of the issuing employer  
- `name`: Recipient’s name  
- `course`: Course or program name  
- `dateOfIssue`: Date of issuance  

---

### `checkCertificate(uint256 certificationId) → bool`
Checks if a certificate exists.  
**Returns:** `true` if the certificate exists, otherwise `false`.

---

### `getCertificate(uint256 certificationId) → (string name, string course, string dateOfIssue)`
Retrieves details of a certificate.  
**Returns:**  
- `name` — Certificate holder’s name  
- `course` — Course title  
- `dateOfIssue` — Date of issuance  

---

## ⚠️ Custom Errors

| Error | Description |
|--------|-------------|
| `NotEmployer()` | Thrown when an unregistered employer attempts restricted actions |
| `notOwner()` | Thrown when a non-owner attempts restricted actions |

---

## 🚀 Example Workflow

1. **Deploy the contract.**  
   The deployer becomes the owner.

2. **Register an employer:**
   ```solidity
   registerEmployer(1, "OpenAI Academy");
   ```

3. **Employer issues a certificate:**
   ```solidity
   addCertificate(1001, 1, "Alice", "Blockchain Fundamentals", "2025-10-18");
   ```

4. **Verify a certificate:**
   ```solidity
   checkCertificate(1001); // returns true
   ```

5. **Fetch certificate details:**
   ```solidity
   getCertificate(1001);
   // returns ("Alice", "Blockchain Fundamentals", "2025-10-18")
   ```

---

## 🧰 Developer Notes
- Employer and certificate IDs must be **unique**.  
- Uses mappings for efficient lookups and gas optimization.  
- No external dependencies — fully written in Solidity.  
- Recommended compiler: **v0.8.24 or newer**.

---

## 🧪 How to Deploy on Remix
1. Open [Remix IDE](https://remix.ethereum.org/).  
2. Create a new file named `Certification.sol`.  
3. Paste the contract code into it.  
4. Compile using **Solidity 0.8.24**.  
5. Deploy the contract.  
6. Use the “registerEmployer” and “addCertificate” functions to test functionality.

---

## 📜 License
This project is licensed under the **MIT License**.
