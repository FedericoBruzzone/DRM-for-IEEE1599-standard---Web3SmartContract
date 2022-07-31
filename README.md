# IP_DRM_for_IEEE1599standard

[![License](https://img.shields.io/badge/License-MIT-blue)](https://github.com/FedericoBruzzone/IP_DRM_for_IEEE1599standard/edit/master/License)
[![Make with](https://img.shields.io/badge/Make%20with-Solidity-orange)](https://en.wikipedia.org/wiki/Solidity)
[![NodeJS](https://img.shields.io/badge/NodeJS-v12.0.0-green)](https://nodejs.dev/learn)
[![stability-experimental](https://img.shields.io/badge/stability-experimental-orange.svg)](https://github.com/emersion/stability-badges#experimental)

# Introduction 
The management of intellectual property and Digital Rights Management on blockchain for the IEEE 1599 standard, arises because there is a need to protect the intellectual property of those who collaborated in the creation of the file IEEE 1599, and at the same time protect the companies or composers who own the rights of a particular digital object (audio file, score, etc...).

# Setup 


1. Install [Visual studio Code](https://visualstudio.microsoft.com)

2. Install Solidity extention for Visual Studio Code

3. Install [npm and node.js](https://docs.npmjs.com/downloading-and-installing-node-js-and-npm)

```
npm install -g npm
```

4. Install [web3.js](https://www.npmjs.com/package/web3)

```
npm install web3
```

5. Install [truffle](https://trufflesuite.com/docs/truffle/getting-started/installation/) 

    `Requirements: NodeJS v12 or later`

```
npm install -g truffle
```

---

### First step 

Now, you can setup the folder where the project is

```
truffle unbox react
```

### Second step
You have to initialize npm. This command has to create a noded-modules folder

```
npm init -y
```

### Third step

After the folder setup, you can create 10 private key to test the project

```
truffle development
```

### Fourth step

You can use migrate command to compile and deploy the smart contracts

```
migrate
```

### Fifth step
Now, you have to open a new terminal window and you have to go in the Client folder and have to start npm

```
npm start
```

# Troubleshooting
If you find problems with the source code or configuration, please contact me at federico.bruzzone.i@gmail.com.

If this is your first time using this technologies, i understand that the configuration of this project is not easy.
