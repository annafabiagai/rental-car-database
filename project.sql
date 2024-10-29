create table customer(
user_id  BIGINT NOT NULL PRIMARY KEY,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
nationality VARCHAR(50) NOT NULL,
email VARCHAR(150) NOT NULL,
telephone VARCHAR(20) 

/*NO FOREIGN KEY */

);

create table classification(
    id_type VARCHAR(50) NOT NULL PRIMARY KEY,
    cost_day INT NOT NULL 

    /*NO FOREIGN KEY */
);

create table car (
    plate INTEGER NOT NULL PRIMARY KEY,
    model VARCHAR(50) NOT NULL ,
    brand VARCHAR(50) NOT NULL ,
    engine VARCHAR(50) NOT NULL,
    type_car VARCHAR(50) NOT NULL,

    CONSTRAINT fk_classification 
        FOREIGN KEY (type_car)
            references classification(id_type)
    
    /* 1 FOREIGN KEY */
);

create table reservation(
    reservation_number INT NOT NULL PRIMARY KEY ,
    date_reservation DATE NOT NULL,
    customer_id INT NOT NULL,
    type_reservation VARCHAR(50) NOT NULL,
    insurance_type VARCHAR(50),
    car_id INT NOT NULL,

    CONSTRAINT fk_customer
        FOREIGN KEY(customer_id)
            references Customer(user_id),
    
    CONSTRAINT fk_car
        foreign key(car_id)
            references car(plate)

 /* 2 FOREIGN KEY */   
    
);


create table trip(
    res_id INT NOT NULL PRIMARY KEY,
    km INT NOT NULL,
    days_trip INT NOT NULL,
    car_id INT not null,

    CONSTRAINT fk_car 
        FOREIGN KEY (car_id)
            references car(plate),

    CONSTRAINT fk_res
        FOREIGN KEY (res_id)
            references reservation(reservation_number)

/* 2 FOREIGN KEY */

);







