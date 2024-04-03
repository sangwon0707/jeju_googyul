CREATE TABLE `Customer` (
	`cno`	NUMBER	NOT NULL	DEFAULT c for customer,
	`c_name`	VARCHAR2(20)	NOT NULL,
	`c_email`	VARCHAR2(50)	NOT NULL,
	`c_phone`	VARCHAR2(11)	NOT NULL,
	`c_pwd`	VARCHAR2(20)	NOT NULL,
	`nickname`	VARCHAR2(20)	NOT NULL
);

CREATE TABLE `Review` (
	`reno`	NUMBER	NOT NULL	DEFAULT re for reviews,
	`re_title`	VARCHAR2	NOT NULL,
	`re_context`	VARCHAR2	NOT NULL,
	`re_date`	DATE	NOT NULL,
	`rating`	NUMBER	NOT NULL,
	`pno`	NUMBER	NOT NULL,
	`cno`	NUMBER	NOT NULL
);

CREATE TABLE `Product` (
	`pno`	NUMBER	NOT NULL	DEFAULT p for product,
	`p_phone`	CHAR	NOT NULL,
	`p_name`	VARCHAR2	NOT NULL,
	`addr`	VARCHAR2	NOT NULL,
	`occ_max`	NUMBER	NULL,
	`price`	NUMBER	NOT NULL,
	`rating`	NUMBER	NULL	DEFAULT 상품에 대한 리뷰 전체의 평점 평균,
	`lat`	NUMBER	NOT NULL,
	`lng`	NUMBER	NOT NULL,
	`a_code`	NUMBER	NOT NULL,
	`p_code`	NUMBER	NOT NULL
);

CREATE TABLE `Reservation` (
	`rno`	NUMBER	NOT NULL	DEFAULT r for reservation,
	`cardno`	CHAR	NOT NULL,
	`checkin_date`	DATE	NOT NULL,
	`checkout_date`	DATE	NOT NULL,
	`guests`	NUMBER	NOT NULL,
	`saleprice`	NUMBER	NOT NULL,
	`cno`	NUMBER	NOT NULL,
	`pno`	NUMBER	NOT NULL
);

CREATE TABLE `ProductType` (
	`p_code`	NUMBER	NOT NULL,
	`p_type`	VARCHAR2(20)	NOT NULL
);

CREATE TABLE `AreaType` (
	`a_code`	NUMBER	NOT NULL	DEFAULT a for area,
	`a_type`	VARCHAR2	NOT NULL
);

CREATE TABLE `Wishlist` (
	`wno`	NUMBER	NOT NULL	DEFAULT w for wishlist,
	`cno`	NUMBER	NOT NULL	DEFAULT 위시리스트 전부 낫널,
	`pno`	NUMBER	NOT NULL
);

CREATE TABLE `Image` (
	`imgno`	NUMBER	NOT NULL	DEFAULT img for image,
	`img1`	VARCHAR2	NOT NULL,
	`img2`	VARCHAR(255)	NULL,
	`img3`	VARCHAR(255)	NULL,
	`img4`	VARCHAR(255)	NULL,
	`img5`	VARCHAR(255)	NULL,
	`pno`	NUMBER	NOT NULL
);

CREATE TABLE `Amenity` (
	`pno`	NUMBER	NOT NULL	DEFAULT p for product,
	`wifi`	BOOLEAN	NULL,
	`parking`	BOOLEAN	NULL,
	`cooking`	BOOLEAN	NULL,
	`ac`	BOOLEAN	NULL,
	`wm`	BOOLEAN	NULL
);

ALTER TABLE `Customer` ADD CONSTRAINT `PK_CUSTOMER` PRIMARY KEY (
	`cno`
);

ALTER TABLE `Review` ADD CONSTRAINT `PK_REVIEW` PRIMARY KEY (
	`reno`
);

ALTER TABLE `Product` ADD CONSTRAINT `PK_PRODUCT` PRIMARY KEY (
	`pno`
);

ALTER TABLE `Reservation` ADD CONSTRAINT `PK_RESERVATION` PRIMARY KEY (
	`rno`
);

ALTER TABLE `ProductType` ADD CONSTRAINT `PK_PRODUCTTYPE` PRIMARY KEY (
	`p_code`
);

ALTER TABLE `AreaType` ADD CONSTRAINT `PK_AREATYPE` PRIMARY KEY (
	`a_code`
);

ALTER TABLE `Wishlist` ADD CONSTRAINT `PK_WISHLIST` PRIMARY KEY (
	`wno`
);

ALTER TABLE `Image` ADD CONSTRAINT `PK_IMAGE` PRIMARY KEY (
	`imgno`
);

ALTER TABLE `Amenity` ADD CONSTRAINT `PK_AMENITY` PRIMARY KEY (
	`pno`
);

ALTER TABLE `Review` ADD CONSTRAINT `FK_Product_TO_Review_1` FOREIGN KEY (
	`pno`
)
REFERENCES `Product` (
	`pno`
);

ALTER TABLE `Review` ADD CONSTRAINT `FK_Customer_TO_Review_1` FOREIGN KEY (
	`cno`
)
REFERENCES `Customer` (
	`cno`
);

ALTER TABLE `Product` ADD CONSTRAINT `FK_AreaType_TO_Product_1` FOREIGN KEY (
	`a_code`
)
REFERENCES `AreaType` (
	`a_code`
);

ALTER TABLE `Product` ADD CONSTRAINT `FK_ProductType_TO_Product_1` FOREIGN KEY (
	`p_code`
)
REFERENCES `ProductType` (
	`p_code`
);

ALTER TABLE `Reservation` ADD CONSTRAINT `FK_Customer_TO_Reservation_1` FOREIGN KEY (
	`cno`
)
REFERENCES `Customer` (
	`cno`
);

ALTER TABLE `Reservation` ADD CONSTRAINT `FK_Product_TO_Reservation_1` FOREIGN KEY (
	`pno`
)
REFERENCES `Product` (
	`pno`
);

ALTER TABLE `Wishlist` ADD CONSTRAINT `FK_Customer_TO_Wishlist_1` FOREIGN KEY (
	`cno`
)
REFERENCES `Customer` (
	`cno`
);

ALTER TABLE `Wishlist` ADD CONSTRAINT `FK_Product_TO_Wishlist_1` FOREIGN KEY (
	`pno`
)
REFERENCES `Product` (
	`pno`
);

ALTER TABLE `Image` ADD CONSTRAINT `FK_Product_TO_Image_1` FOREIGN KEY (
	`pno`
)
REFERENCES `Product` (
	`pno`
);

ALTER TABLE `Amenity` ADD CONSTRAINT `FK_Product_TO_Amenity_1` FOREIGN KEY (
	`pno`
)
REFERENCES `Product` (
	`pno`
);

