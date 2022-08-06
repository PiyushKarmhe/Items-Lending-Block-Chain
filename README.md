# Items-Lending-Block-Chain
Items Lending and Returning log keeper using solidity and Block-Chain technology

This is a Smart Contract made to keep Lending and returning records of any item by one user to anyother user.

It has 5 Functions in it :-

1) Lending :- It is used to lend Item to a user by the owner of the Item. This function takes 3 arguments address of the borrower, what Item is being given and date.
2) Returning :- It is used to return borrowed Items. It takes 2 parameter address of user from whom item was borrowed and item name.
3) Borrow :- It is used to check the Items one has borrowed. It takes 2 parameters address of user from whom item was borrowed and item name.
4) Returned :- It is used to check return status of the lended Items. It takes 2 parameters address of user who borrowed and item name.
5) Reg_user :- It is used to register user. It takes 2 parameter name and password.

Process Status are Updated in mssg and stat variables.

Further Scopes for development :-
1) Making mssg contain more info like telling the name of the person who has borrowed or lended.
2) Authenticating with password.
3) Make a function to provide deatiled info about items which are not retuned yet to lender.
4) Make a function to provide deatiled info about items which are yet to be retuned to borrower.

Why Use solidity or Block-Chain Technology for this?
The same functionality can also be achieved by using a simple database system too but that can never provide security as much as Block-Chain can provide.
As every transaction that happens here is recorded and are immutable. Blockchain technology produces a structure of data with inherent security qualities. It's based on principles of cryptography, decentralization and consensus, which ensure trust in transactions. So it can easily beat any other system in terms of security.

Steps to run :- 
1) Open https://remix.ethereum.org/#optimize=false&runs=200&evmVersion=null&version=soljson-v0.8.15+commit.e14f2714.js&language=Solidity
2) Copy past solidity code in the txt editor.
3) Compile the code
4) Deploy the code
5) Then do transactions as per your need.
