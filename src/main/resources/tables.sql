-- Message Table
CREATE TABLE Message (MessageID INT PRIMARY KEY,
                         SenderID INT,
                         RecipientID INT,
                         Content TEXT,
                         Timestamp DATETIME,
                         ConversationID INT,
                         FOREIGN KEY (SenderID) REFERENCES User(UserID),
                         FOREIGN KEY (RecipientID) REFERENCES User(UserID),
                         FOREIGN KEY (ConversationID) REFERENCES Conversation(ConversationID)
    -- Additional attributes as needed
);

-- Conversation Table
CREATE TABLE Conversation (
                              ConversationID INT PRIMARY KEY,
                              Subject VARCHAR(255)
    -- Additional attributes as needed
);

-- User Table
CREATE TABLE User (
                      UserID INT PRIMARY KEY,
                      Username VARCHAR(100) UNIQUE,
                      Email VARCHAR(255)
    -- Additional attributes as needed
);

-- Contact Table
CREATE TABLE Contact (
                         ContactID INT PRIMARY KEY,
                         UserID INT,
                         ContactUserID INT,
                         FOREIGN KEY (UserID) REFERENCES User(UserID),
                         FOREIGN KEY (ContactUserID) REFERENCES User(UserID)
    -- Additional attributes as needed
);

-- Notification Table
CREATE TABLE Notification (
                              NotificationID INT PRIMARY KEY,
                              UserID INT,
                              Content TEXT,
                              Timestamp DATETIME,
                              FOREIGN KEY (UserID) REFERENCES User(UserID)
    -- Additional attributes as needed
);

-- Order Table
CREATE TABLE Order (
                       OrderID INT PRIMARY KEY,
                       UserID INT,
                       ItemID INT,
                       Quantity INT,
                       ItemPrice NUMBER,
                       Description TEXT,
                       CreatedAt DATETIME,
                       UpdatedAt DATETIME,
                       FOREIGN KEY (UserID) REFERENCES User(UserID)
                           FOREIGN KEY (ItemID) REFERENCES Item(ItemID)
    -- Additional attributes as needed
);

-- Item Table
CREATE TABLE Item (
                      ItemID INT PRIMARY KEY,
                      UserID INT,
                      Name TEXT,
                      Description TEXT,
                      Category TEXT,
                      Timestamp DATETIME,
                      FOREIGN KEY (UserID) REFERENCES User(UserID)
    -- Additional attributes as needed
);

-- Payment Table
CREATE TABLE Payment (
                         PaymentID INT PRIMARY KEY,
                         UserID INT,
                         Name TEXT,
                         Description TEXT,
                         Category TEXT,
                         Timestamp DATETIME,
                         FOREIGN KEY (UserID) REFERENCES User(UserID)
    -- Additional attributes as needed
);

-- Shipment Table
CREATE TABLE Shipment (
                          ShipmentID INT PRIMARY KEY,
                          OrderID INT,
                          Status TEXT,
                          Courier TEXT,
                          CourierReferenceCode TEXT,
                          CreatedAt DATETIME,
                          UpdatedAt DATETIME,
                          Timestamp DATETIME,
                          FOREIGN KEY (OrderID) REFERENCES Order(OrderID)
    -- Additional attributes as needed
);
