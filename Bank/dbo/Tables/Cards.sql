CREATE TABLE Cards(
    Card_ID INT NOT NULL,
	MoneyOnCard decimal(18, 2) NOT NULL,
	Client_FK INT NOT NULL
	primary key (Card_ID)
);
ALTER TABLE Cards  WITH CHECK ADD  CONSTRAINT [FK_Client_Account] FOREIGN KEY([Client_FK])
REFERENCES [Client_Data] ([ClientID])

INSERT INTO Cards
    (Card_ID, MoneyOnCard, Client_FK)
VALUES
     (1, 250.00, 1),
	 (2, 250.00, 1),
	 (3, 200.00, 2),
	 (4, 300.00, 3),
	 (5, 400.00, 4),
	 (6, 200.00, 4),
	 (7, 100.00, 5)
	 ;
