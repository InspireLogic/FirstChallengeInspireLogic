create table agents
(
    id             int auto_increment
        primary key,
    name_agents    varchar(60)                         not null,
    email_agents   varchar(60)                         null,
    specialization varchar(10)                         not null,
    avaliable      tinyint(1)                          not null,
    created_at     timestamp default CURRENT_TIMESTAMP null
);

create table passes
(
    id            int auto_increment
        primary key,
    resort_id     int                                                         not null,
    type          enum ('daily', 'montly', 'weekend', 'vactions', 'holidays') null,
    validity_days int                                                         not null
);

create table regions
(
    id          int auto_increment
        primary key,
    name_local  varchar(60)  not null,
    description text         null,
    image_ur    varchar(100) null
);

create table lodging
(
    id              int auto_increment
        primary key,
    region_id       int                                           not null,
    name_lodging    varchar(60)                                   not null,
    type            enum ('camping', 'hotel', 'hosted', 'resort') null,
    price_per_night decimal(10, 2)                                not null,
    max_guests      int                                           not null,
    image_url       varchar(100)                                  not null,
    constraint fk_regions_lodging
        foreign key (id) references regions (id)
);

create table resorts
(
    id          int auto_increment
        primary key,
    region_id   int          not null,
    name_resort varchar(60)  not null,
    description text         null,
    lift_access tinyint(1)   not null,
    image_url   varchar(100) not null,
    constraint fk_resort_lodging
        foreign key (region_id) references lodging (id)
);

create table users
(
    id             int auto_increment
        primary key,
    name           varchar(60)                         not null,
    email          varchar(60)                         null,
    passwordo_hash varchar(60)                         not null,
    phone          int                                 null,
    created_at     timestamp default CURRENT_TIMESTAMP null
);

create table trips
(
    id          int auto_increment
        primary key,
    user_id     int                                      not null,
    agent_id    int                                      not null,
    start_date  date                                     not null,
    end_date    date                                     not null,
    local_price decimal(10, 2)                           not null,
    status      enum ('plannig', 'canceled', 'confimed') null,
    constraint fk_trips_agents
        foreign key (agent_id) references agents (id),
    constraint fk_trips_user
        foreign key (user_id) references users (id)
);

create table trip_items
(
    id        int auto_increment
        primary key,
    trip_id   int                                not null,
    item_type enum ('lodging', 'pass', 'resort') not null,
    item_id   varchar(120)                       not null,
    quantity  int                                not null,
    price     decimal(10, 2)                     not null,
    constraint fk_trip_item_trips
        foreign key (trip_id) references trips (id)
);

