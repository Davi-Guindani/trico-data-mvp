INSERT INTO
  auth.users (
    instance_id,
    id,
    aud,
    role,
    email,
    encrypted_password,
    email_confirmed_at,
    recovery_sent_at,
    last_sign_in_at,
    raw_app_meta_data,
    raw_user_meta_data,
    created_at,
    updated_at,
    confirmation_token,
    email_change,
    email_change_token_new,
    recovery_token
  )
VALUES
  (
    '00000000-0000-0000-0000-000000000000',
    uuid_generate_v4 (),
    'authenticated',
    'authenticated',
    'clinic_admin1@gmail.com',
    crypt ('123456', gen_salt ('bf')),
    CURRENT_TIMESTAMP,
    CURRENT_TIMESTAMP,
    CURRENT_TIMESTAMP,
    '{"provider":"email","providers":["email"]}',
    '{}',
    CURRENT_TIMESTAMP,
    CURRENT_TIMESTAMP,
    '',
    '',
    '',
    ''
  ),
  (
    '00000000-0000-0000-0000-000000000000',
    uuid_generate_v4 (),
    'authenticated',
    'authenticated',
    'clinic_admin2@gmail.com',
    crypt ('123456', gen_salt ('bf')),
    CURRENT_TIMESTAMP,
    CURRENT_TIMESTAMP,
    CURRENT_TIMESTAMP,
    '{"provider":"email","providers":["email"]}',
    '{}',
    CURRENT_TIMESTAMP,
    CURRENT_TIMESTAMP,
    '',
    '',
    '',
    ''
  ),
  (
    '00000000-0000-0000-0000-000000000000',
    uuid_generate_v4 (),
    'authenticated',
    'authenticated',
    'secretary1@gmail.com',
    crypt ('123456', gen_salt ('bf')),
    CURRENT_TIMESTAMP,
    CURRENT_TIMESTAMP,
    CURRENT_TIMESTAMP,
    '{"provider":"email","providers":["email"]}',
    '{}',
    CURRENT_TIMESTAMP,
    CURRENT_TIMESTAMP,
    '',
    '',
    '',
    ''
  ),
  (
    '00000000-0000-0000-0000-000000000000',
    uuid_generate_v4 (),
    'authenticated',
    'authenticated',
    'secretary2@gmail.com',
    crypt ('123456', gen_salt ('bf')),
    CURRENT_TIMESTAMP,
    CURRENT_TIMESTAMP,
    CURRENT_TIMESTAMP,
    '{"provider":"email","providers":["email"]}',
    '{}',
    CURRENT_TIMESTAMP,
    CURRENT_TIMESTAMP,
    '',
    '',
    '',
    ''
  ),
  (
    '00000000-0000-0000-0000-000000000000',
    uuid_generate_v4 (),
    'authenticated',
    'authenticated',
    'tricologist1@gmail.com',
    crypt ('123456', gen_salt ('bf')),
    CURRENT_TIMESTAMP,
    CURRENT_TIMESTAMP,
    CURRENT_TIMESTAMP,
    '{"provider":"email","providers":["email"]}',
    '{}',
    CURRENT_TIMESTAMP,
    CURRENT_TIMESTAMP,
    '',
    '',
    '',
    ''
  ),
  (
    '00000000-0000-0000-0000-000000000000',
    uuid_generate_v4 (),
    'authenticated',
    'authenticated',
    'tricologist2@gmail.com',
    crypt ('123456', gen_salt ('bf')),
    CURRENT_TIMESTAMP,
    CURRENT_TIMESTAMP,
    CURRENT_TIMESTAMP,
    '{"provider":"email","providers":["email"]}',
    '{}',
    CURRENT_TIMESTAMP,
    CURRENT_TIMESTAMP,
    '',
    '',
    '',
    ''
  );

INSERT INTO
  auth.identities (
    id,
    user_id,
    provider_id,
    identity_data,
    provider,
    last_sign_in_at,
    created_at,
    updated_at
  )
SELECT
  uuid_generate_v4 (),
  id,
  id,
  format('{"sub":"%s","email":"%s"}', id :: text, email) :: jsonb,
  'email',
  CURRENT_TIMESTAMP,
  CURRENT_TIMESTAMP,
  CURRENT_TIMESTAMP
FROM
  auth.users;

INSERT INTO
  clinics (name)
VALUES
  ('clinica teste 1'),
  ('clinica teste 2');

INSERT INTO
  public.profiles (id, username, full_name, clinic_id)
VALUES
  (
    (
      SELECT
        id
      FROM
        auth.users
      WHERE
        email = 'clinic_admin1@gmail.com'
    ),
    'joão_silva',
    'joão silva',
    (
      SELECT
        id
      FROM
        clinics
      WHERE
        name = 'clinica teste 1'
    )
  ),
  (
    (
      SELECT
        id
      FROM
        auth.users
      WHERE
        email = 'clinic_admin2@gmail.com'
    ),
    'gabriel_pereira',
    'gabriel pereira',
    (
      SELECT
        id
      FROM
        clinics
      WHERE
        name = 'clinica teste 2'
    )
  ),
  (
    (
      SELECT
        id
      FROM
        auth.users
      WHERE
        email = 'secretary1@gmail.com'
    ),
    'ana_costa',
    'ana costa',
    (
      SELECT
        id
      FROM
        clinics
      WHERE
        name = 'clinica teste 1'
    )
  ),
  (
    (
      SELECT
        id
      FROM
        auth.users
      WHERE
        email = 'secretary2@gmail.com'
    ),
    'lucas_almeida',
    'lucas almeida',
    (
      SELECT
        id
      FROM
        clinics
      WHERE
        name = 'clinica teste 2'
    )
  ),
  (
    (
      SELECT
        id
      FROM
        auth.users
      WHERE
        email = 'tricologist1@gmail.com'
    ),
    'fernanda_almeida',
    'fernanda almeida',
    (
      SELECT
        id
      FROM
        clinics
      WHERE
        name = 'clinica teste 1'
    )
  ),
  (
    (
      SELECT
        id
      FROM
        auth.users
      WHERE
        email = 'tricologist2@gmail.com'
    ),
    'lara_santos',
    'lara santos',
    (
      SELECT
        id
      FROM
        clinics
      WHERE
        name = 'clinica teste 2'
    )
  );

INSERT INTO
  roles (name)
VALUES
  ('clinic_admin'),
  ('secretary'),
  ('tricologist');

INSERT INTO
  profiles_roles (profile_id, role_id)
VALUES
  (
    (
      SELECT
        id
      FROM
        public.profiles
      WHERE
        username = 'joão_silva'
    ),
    (
      SELECT
        id
      FROM
        roles
      WHERE
        name = 'clinic_admin'
    )
  ),
  (
    (
      SELECT
        id
      FROM
        public.profiles
      WHERE
        username = 'gabriel_pereira'
    ),
    (
      SELECT
        id
      FROM
        roles
      WHERE
        name = 'clinic_admin'
    )
  ),
  (
    (
      SELECT
        id
      FROM
        public.profiles
      WHERE
        username = 'ana_costa'
    ),
    (
      SELECT
        id
      FROM
        roles
      WHERE
        name = 'secretary'
    )
  ),
  (
    (
      SELECT
        id
      FROM
        public.profiles
      WHERE
        username = 'lucas_almeida'
    ),
    (
      SELECT
        id
      FROM
        roles
      WHERE
        name = 'secretary'
    )
  ),
  (
    (
      SELECT
        id
      FROM
        public.profiles
      WHERE
        username = 'fernanda_almeida'
    ),
    (
      SELECT
        id
      FROM
        roles
      WHERE
        name = 'tricologist'
    )
  ),
  (
    (
      SELECT
        id
      FROM
        public.profiles
      WHERE
        username = 'lara_santos'
    ),
    (
      SELECT
        id
      FROM
        roles
      WHERE
        name = 'tricologist'
    )
  );

INSERT INTO
  products (name, clinic_id, sale_price)
VALUES
  (
    'loção capilar',
    (
      SELECT
        id
      FROM
        clinics
      WHERE
        name = 'clinica teste 1'
    ),
    59.90
  ),
  (
    'leave-in',
    (
      SELECT
        id
      FROM
        clinics
      WHERE
        name = 'clinica teste 1'
    ),
    129.90
  ),
  (
    'creme de cabelo',
    (
      SELECT
        id
      FROM
        clinics
      WHERE
        name = 'clinica teste 2'
    ),
    49.90
  ),
  (
    'condicionador',
    (
      SELECT
        id
      FROM
        clinics
      WHERE
        name = 'clinica teste 2'
    ),
    39.90
  );

INSERT INTO
  services (name, clinic_id, sale_price)
VALUES
  (
    'microagulhamento',
    (
      SELECT
        id
      FROM
        clinics
      WHERE
        name = 'clinica teste 1'
    ),
    199.90
  ),
  (
    'vacuoterapia',
    (
      SELECT
        id
      FROM
        clinics
      WHERE
        name = 'clinica teste 1'
    ),
    149.90
  ),
  (
    'microagulhamento',
    (
      SELECT
        id
      FROM
        clinics
      WHERE
        name = 'clinica teste 2'
    ),
    209.90
  ),
  (
    'massagem',
    (
      SELECT
        id
      FROM
        clinics
      WHERE
        name = 'clinica teste 2'
    ),
    99.90
  );

INSERT INTO
  customers (clinic_id, first_name, last_name)
VALUES
  (
    (
      SELECT
        id
      FROM
        clinics
      WHERE
        name = 'clinica teste 1'
    ),
    'davi',
    'guindani padrão vieira'
  ),
  (
    (
      SELECT
        id
      FROM
        clinics
      WHERE
        name = 'clinica teste 1'
    ),
    'josyane',
    'de abreu koppe'
  ),
  (
    (
      SELECT
        id
      FROM
        clinics
      WHERE
        name = 'clinica teste 2'
    ),
    'gabriela',
    'lima'
  ),
  (
    (
      SELECT
        id
      FROM
        clinics
      WHERE
        name = 'clinica teste 2'
    ),
    'victoria',
    'santos'
  );

INSERT INTO
  provisions (
    service_id,
    tricologist_id,
    secretary_id,
    customer_id,
    date
  )
VALUES
  (
    (
      SELECT
        id
      FROM
        services
      WHERE
        name = 'microagulhamento'
        AND clinic_id = (
          SELECT
            id
          FROM
            clinics
          WHERE
            name = 'clinica teste 1'
        )
    ),
    (
      SELECT
        profile_id
      FROM
        profiles_roles_view prv
        JOIN profiles p ON prv.profile_id = p.id
      WHERE
        'tricologist' = ANY(prv.roles)
        AND p.clinic_id = (
          SELECT
            id
          FROM
            clinics
          WHERE
            name = 'clinica teste 1'
        )
    ),
    (
      SELECT
        profile_id
      FROM
        profiles_roles_view prv
        JOIN profiles p ON prv.profile_id = p.id
      WHERE
        'secretary' = ANY(prv.roles)
        AND p.clinic_id = (
          SELECT
            id
          FROM
            clinics
          WHERE
            name = 'clinica teste 1'
        )
    ),
    (
      SELECT
        id
      FROM
        customers
      WHERE
        first_name = 'davi'
        AND last_name = 'guindani padrão vieira'
        AND clinic_id = (
          SELECT
            id
          FROM
            clinics
          WHERE
            name = 'clinica teste 1'
        )
    ),
    (CURRENT_TIMESTAMP + INTERVAL '1 day')
  ),
  (
    (
      SELECT
        id
      FROM
        services
      WHERE
        name = 'vacuoterapia'
        AND clinic_id = (
          SELECT
            id
          FROM
            clinics
          WHERE
            name = 'clinica teste 1'
        )
    ),
    (
      SELECT
        profile_id
      FROM
        profiles_roles_view prv
        JOIN profiles p ON prv.profile_id = p.id
      WHERE
        'tricologist' = ANY(prv.roles)
        AND p.clinic_id = (
          SELECT
            id
          FROM
            clinics
          WHERE
            name = 'clinica teste 1'
        )
    ),
    (
      SELECT
        profile_id
      FROM
        profiles_roles_view prv
        JOIN profiles p ON prv.profile_id = p.id
      WHERE
        'secretary' = ANY(prv.roles)
        AND p.clinic_id = (
          SELECT
            id
          FROM
            clinics
          WHERE
            name = 'clinica teste 1'
        )
    ),
    (
      SELECT
        id
      FROM
        customers
      WHERE
        first_name = 'josyane'
        AND last_name = 'de abreu koppe'
        AND clinic_id = (
          SELECT
            id
          FROM
            clinics
          WHERE
            name = 'clinica teste 1'
        )
    ),
    (CURRENT_TIMESTAMP + INTERVAL '2 day')
  ),
  (
    (
      SELECT
        id
      FROM
        services
      WHERE
        name = 'microagulhamento'
        AND clinic_id = (
          SELECT
            id
          FROM
            clinics
          WHERE
            name = 'clinica teste 2'
        )
    ),
    (
      SELECT
        profile_id
      FROM
        profiles_roles_view prv
        JOIN profiles p ON prv.profile_id = p.id
      WHERE
        'tricologist' = ANY(prv.roles)
        AND p.clinic_id = (
          SELECT
            id
          FROM
            clinics
          WHERE
            name = 'clinica teste 2'
        )
    ),
    (
      SELECT
        profile_id
      FROM
        profiles_roles_view prv
        JOIN profiles p ON prv.profile_id = p.id
      WHERE
        'secretary' = ANY(prv.roles)
        AND p.clinic_id = (
          SELECT
            id
          FROM
            clinics
          WHERE
            name = 'clinica teste 2'
        )
    ),
    (
      SELECT
        id
      FROM
        customers
      WHERE
        first_name = 'gabriela'
        AND last_name = 'lima'
        AND clinic_id = (
          SELECT
            id
          FROM
            clinics
          WHERE
            name = 'clinica teste 2'
        )
    ),
    (CURRENT_TIMESTAMP + INTERVAL '3 day')
  );

INSERT INTO
  purchases (clinic_id, date, cost)
VALUES
  (
    (
      SELECT
        id
      FROM
        clinics
      WHERE
        name = 'clinica teste 1'
    ),
    CURRENT_TIMESTAMP,
    100.00
  ),
  (
    (
      SELECT
        id
      FROM
        clinics
      WHERE
        name = 'clinica teste 2'
    ),
    CURRENT_TIMESTAMP,
    200.00
  );

INSERT INTO
  purchases_products (purchase_id, product_id, quantity, unit_price)
VALUES
  (
    (
      SELECT
        id
      FROM
        purchases
      WHERE
        clinic_id = (
          SELECT
            id
          FROM
            clinics
          WHERE
            name = 'clinica teste 1'
        )
    ),
    (
      SELECT
        id
      FROM
        products
      WHERE
        name = 'loção capilar'
        AND clinic_id = (
          SELECT
            id
          FROM
            clinics
          WHERE
            name = 'clinica teste 1'
        )
    ),
    2,
    25.00
  ),
  (
    (
      SELECT
        id
      FROM
        purchases
      WHERE
        clinic_id = (
          SELECT
            id
          FROM
            clinics
          WHERE
            name = 'clinica teste 1'
        )
    ),
    (
      SELECT
        id
      FROM
        products
      WHERE
        name = 'leave-in'
        AND clinic_id = (
          SELECT
            id
          FROM
            clinics
          WHERE
            name = 'clinica teste 1'
        )
    ),
    1,
    50
  ),
  (
    (
      SELECT
        id
      FROM
        purchases
      WHERE
        clinic_id = (
          SELECT
            id
          FROM
            clinics
          WHERE
            name = 'clinica teste 2'
        )
    ),
    (
      SELECT
        id
      FROM
        products
      WHERE
        name = 'creme de cabelo'
        AND clinic_id = (
          SELECT
            id
          FROM
            clinics
          WHERE
            name = 'clinica teste 2'
        )
    ),
    5,
    40
  );

INSERT INTO
  sales (clinic_id, date, revenue)
VALUES
  (
    (
      SELECT
        id
      FROM
        clinics
      WHERE
        name = 'clinica teste 1'
    ),
    CURRENT_TIMESTAMP,
    119.80
  ),
  (
    (
      SELECT
        id
      FROM
        clinics
      WHERE
        name = 'clinica teste 2'
    ),
    CURRENT_TIMESTAMP,
    99.80
  ),
  (
    (
      SELECT
        id
      FROM
        clinics
      WHERE
        name = 'clinica teste 1'
    ),
    CURRENT_TIMESTAMP,
    389.7
  ),
  (
    (
      SELECT
        id
      FROM
        clinics
      WHERE
        name = 'clinica teste 2'
    ),
    CURRENT_TIMESTAMP,
    159.60
  ),
  (
    (
      SELECT
        id
      FROM
        clinics
      WHERE
        name = 'clinica teste 1'
    ),
    CURRENT_TIMESTAMP,
    349.80
  ),
  (
    (
      SELECT
        id
      FROM
        clinics
      WHERE
        name = 'clinica teste 2'
    ),
    CURRENT_TIMESTAMP,
    309.80
  );

INSERT INTO
  sales_products (sale_id, product_id, quantity, unit_price)
VALUES
  (
    (
      SELECT
        id
      FROM
        sales
      WHERE
        clinic_id = (
          SELECT
            id
          FROM
            clinics
          WHERE
            name = 'clinica teste 1'
        )
        AND revenue = 119.80
    ),
    (
      SELECT
        id
      FROM
        products
      WHERE
        name = 'loção capilar'
        AND clinic_id = (
          SELECT
            id
          FROM
            clinics
          WHERE
            name = 'clinica teste 1'
        )
    ),
    2,
    (
      SELECT
        sale_price
      FROM
        products
      WHERE
        name = 'loção capilar'
        AND clinic_id = (
          SELECT
            id
          FROM
            clinics
          WHERE
            name = 'clinica teste 1'
        )
    )
  ),
  (
    (
      SELECT
        id
      FROM
        sales
      WHERE
        clinic_id = (
          SELECT
            id
          FROM
            clinics
          WHERE
            name = 'clinica teste 2'
        )
        AND revenue = 99.80
    ),
    (
      SELECT
        id
      FROM
        products
      WHERE
        name = 'creme de cabelo'
        AND clinic_id = (
          SELECT
            id
          FROM
            clinics
          WHERE
            name = 'clinica teste 2'
        )
    ),
    2,
    (
      SELECT
        sale_price
      FROM
        products
      WHERE
        name = 'creme de cabelo'
        AND clinic_id = (
          SELECT
            id
          FROM
            clinics
          WHERE
            name = 'clinica teste 2'
        )
    )
  ),
  (
    (
      SELECT
        id
      FROM
        sales
      WHERE
        clinic_id = (
          SELECT
            id
          FROM
            clinics
          WHERE
            name = 'clinica teste 1'
        )
        AND revenue = 389.7
    ),
    (
      SELECT
        id
      FROM
        products
      WHERE
        name = 'leave-in'
        AND clinic_id = (
          SELECT
            id
          FROM
            clinics
          WHERE
            name = 'clinica teste 1'
        )
    ),
    3,
    (
      SELECT
        sale_price
      FROM
        products
      WHERE
        name = 'leave-in'
        AND clinic_id = (
          SELECT
            id
          FROM
            clinics
          WHERE
            name = 'clinica teste 1'
        )
    )
  ),
  (
    (
      SELECT
        id
      FROM
        sales
      WHERE
        clinic_id = (
          SELECT
            id
          FROM
            clinics
          WHERE
            name = 'clinica teste 2'
        )
        AND revenue = 159.60
    ),
    (
      SELECT
        id
      FROM
        products
      WHERE
        name = 'condicionador'
        AND clinic_id = (
          SELECT
            id
          FROM
            clinics
          WHERE
            name = 'clinica teste 2'
        )
    ),
    4,
    (
      SELECT
        sale_price
      FROM
        products
      WHERE
        name = 'condicionador'
        AND clinic_id = (
          SELECT
            id
          FROM
            clinics
          WHERE
            name = 'clinica teste 2'
        )
    )
  );

INSERT INTO
  sales_services (sale_id, service_id, quantity, unit_price)
VALUES
  (
    (
      SELECT
        id
      FROM
        sales
      WHERE
        clinic_id = (
          SELECT
            id
          FROM
            clinics
          WHERE
            name = 'clinica teste 1'
        )
        AND revenue = 349.80
    ),
    (
      SELECT
        id
      FROM
        services
      WHERE
        name = 'microagulhamento'
        AND clinic_id = (
          SELECT
            id
          FROM
            clinics
          WHERE
            name = 'clinica teste 1'
        )
    ),
    1,
    (
      SELECT
        sale_price
      FROM
        services
      WHERE
        name = 'microagulhamento'
        AND clinic_id = (
          SELECT
            id
          FROM
            clinics
          WHERE
            name = 'clinica teste 1'
        )
    )
  ),
  (
    (
      SELECT
        id
      FROM
        sales
      WHERE
        clinic_id = (
          SELECT
            id
          FROM
            clinics
          WHERE
            name = 'clinica teste 1'
        )
        AND revenue = 349.80
    ),
    (
      SELECT
        id
      FROM
        services
      WHERE
        name = 'vacuoterapia'
        AND clinic_id = (
          SELECT
            id
          FROM
            clinics
          WHERE
            name = 'clinica teste 1'
        )
    ),
    1,
    (
      SELECT
        sale_price
      FROM
        services
      WHERE
        name = 'vacuoterapia'
        AND clinic_id = (
          SELECT
            id
          FROM
            clinics
          WHERE
            name = 'clinica teste 1'
        )
    )
  ),
  (
    (
      SELECT
        id
      FROM
        sales
      WHERE
        clinic_id = (
          SELECT
            id
          FROM
            clinics
          WHERE
            name = 'clinica teste 2'
        )
        AND revenue = 309.80
    ),
    (
      SELECT
        id
      FROM
        services
      WHERE
        name = 'microagulhamento'
        AND clinic_id = (
          SELECT
            id
          FROM
            clinics
          WHERE
            name = 'clinica teste 2'
        )
    ),
    1,
    (
      SELECT
        sale_price
      FROM
        services
      WHERE
        name = 'microagulhamento'
        AND clinic_id = (
          SELECT
            id
          FROM
            clinics
          WHERE
            name = 'clinica teste 2'
        )
    )
  ),
  (
    (
      SELECT
        id
      FROM
        sales
      WHERE
        clinic_id = (
          SELECT
            id
          FROM
            clinics
          WHERE
            name = 'clinica teste 2'
        )
        AND revenue = 309.80
    ),
    (
      SELECT
        id
      FROM
        services
      WHERE
        name = 'massagem'
        AND clinic_id = (
          SELECT
            id
          FROM
            clinics
          WHERE
            name = 'clinica teste 2'
        )
    ),
    1,
    (
      SELECT
        sale_price
      FROM
        services
      WHERE
        name = 'massagem'
        AND clinic_id = (
          SELECT
            id
          FROM
            clinics
          WHERE
            name = 'clinica teste 2'
        )
    )
  );