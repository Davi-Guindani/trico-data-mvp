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
  roles (created_at, name)
VALUES
  (CURRENT_TIMESTAMP, 'clinic_admin'),
  (CURRENT_TIMESTAMP, 'secretary'),
  (CURRENT_TIMESTAMP, 'tricologist');

INSERT INTO
  profiles_roles (created_at, profile_id, role_id)
VALUES
  (
    CURRENT_TIMESTAMP,
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
    CURRENT_TIMESTAMP,
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
    CURRENT_TIMESTAMP,
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
    CURRENT_TIMESTAMP,
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
    CURRENT_TIMESTAMP,
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
    CURRENT_TIMESTAMP,
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
  products (name, clinic_id)
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
    )
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
    )
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
    )
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
    )
  );

INSERT INTO
  services (name, clinic_id)
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
    )
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
    )
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
    )
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
    )
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
      LIMIT
        1 -- Garante que apenas um valor seja retornado
    ), (
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
      LIMIT
        1 -- Garante que apenas um valor seja retornado
    ), (
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
      LIMIT
        1 -- Garante que apenas um valor seja retornado
    ), (
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
      LIMIT
        1 -- Garante que apenas um valor seja retornado
    ), (CURRENT_TIMESTAMP + INTERVAL '1 day')
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
      LIMIT
        1 -- Garante que apenas um valor seja retornado
    ), (
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
      LIMIT
        1 -- Garante que apenas um valor seja retornado
    ), (
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
      LIMIT
        1 -- Garante que apenas um valor seja retornado
    ), (
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
      LIMIT
        1 -- Garante que apenas um valor seja retornado
    ), (CURRENT_TIMESTAMP + INTERVAL '2 day')
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
      LIMIT
        1 -- Garante que apenas um valor seja retornado
    ), (
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
      LIMIT
        1 -- Garante que apenas um valor seja retornado
    ), (
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
      LIMIT
        1 -- Garante que apenas um valor seja retornado
    ), (
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
      LIMIT
        1 -- Garante que apenas um valor seja retornado
    ), (CURRENT_TIMESTAMP + INTERVAL '3 day')
  );