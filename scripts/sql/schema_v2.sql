create table field (
    id uuid not null default gen_random_uuid() primary key,
    name text not null,
    type text not null,
    description text,
    is_domain boolean not null,
    unique(name, type)
);

create table domain (
    id uuid not null default gen_random_uuid() primary key,
    field_id uuid not null,
    value text not null,
    constraint fk_domain_field
        foreign key(field_id)
            references field(id)
);

create table nsi_schema (
    id uuid not null default gen_random_uuid() primary key,
    name text not null,
    version text not null,
    notes text,
    unique(name, version)
);

create table schema_field (
    id uuid not null,
    field_id uuid not null,
    is_private boolean not null,
    constraint fk_schema_field_field
        foreign key(field_id)
            references field(id),
    constraint fk_schema_field_schema
        foreign key(id)
            references nsi_schema(id)
);

create table quality (
    id uuid not null default gen_random_uuid() primary key,
    value text not null,
    description text,
    unique(value),
    constraint chk_quality_value
        check (value in ('high', 'med', 'low'))
);

create table nsi_group (
    id uuid not null default gen_random_uuid() primary key,
    name text not null,
    unique(name)
);

create table dataset (
    id uuid not null default gen_random_uuid() primary key,
    name text not null,
    version text not null,
    nsi_schema_id uuid not null,
    table_name text not null,
    shape geometry not null,
    description text,
    purpose text,
    date_created date not null default current_date,
    created_by text not null,
    group_id uuid not null,
    quality_id uuid not null,
    constraint fk_dataset_nsi_schema
        foreign key(nsi_schema_id)
            references nsi_schema(id),
    constraint fk_dataset_quality
        foreign key(quality_id)
            references quality(id),
    constraint fk_dataset_nsi_group
        foreign key(group_id)
            references nsi_group(id),
    unique(name, version, quality_id)
);

-- a member can be in multiple groups
create table group_member (
    id uuid not null default gen_random_uuid() primary key,
    group_id uuid not null,
    role text not null,
    user_id text not null,
    constraint fk_access_dataset
        foreign key(group_id)
            references nsi_group(id),
    unique(user_id, group_id)
);

insert into quality (value, description)
values ('high', '');

insert into quality (value, description)
values ('med', '');

insert into quality (value, description)
values ('low', '');
