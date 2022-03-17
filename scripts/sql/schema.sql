create table nsi_v2022 (
    bid varchar(40),
    cbfips2010 varchar(15),
    st_damcat varchar(4),
    occtype varchar(9),
    num_story int,
    height numeric,
    sqft numeric,
    ftprntsqft numeric,
    found_ht numeric,
    extwall char(1),
    fndtype char(1),
    bsmnt char(1),
    p_extwall char(1),
    p_fndtype char(1),
    p_bsmnt char(1),
    total_room int,
    bedrooms int,
    total_bath int,
    p_garage char(3),
    parkingsp int,
    yrbuilt int,
    med_yr_blt int,
    naics char(6),
    bldcostcat varchar(12),
    val_struct numeric,
    val_cont numeric,
    val_vehic numeric,
    numvehic int,
    ftprntid varchar,
    ftprntsrc varchar(4),
    source char(1),
    resunits int,
    empnum int,
    students int,
    surplus int,
    othinstpop int,
    nursghmpop int,
    pop2amu65 int,
    pop2amo65 int,
    pop2pmu65 int,
    pop2pmo65 int,
    o65disable numeric,
    u65disable numeric,
    x numeric,
    y numeric,
    apn text,
    censregion char(2),
    firmzone char(4),
    firmdate int
)