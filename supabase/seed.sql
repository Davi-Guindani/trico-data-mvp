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
    'clinic_admin@gmail.com',
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
    'secretary@gmail.com',
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
    'tricologist@gmail.com',
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
  ('clinica teste');

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
        email = 'clinic_admin@gmail.com'
    ),
    'joão_silva',
    'joão silva',
    (
      SELECT
        id
      FROM
        clinics
      WHERE
        name = 'clinica teste'
    )
  ),
  (
    (
      SELECT
        id
      FROM
        auth.users
      WHERE
        email = 'secretary@gmail.com'
    ),
    'ana_costa',
    'ana costa',
    (
      SELECT
        id
      FROM
        clinics
      WHERE
        name = 'clinica teste'
    )
  ),
  (
    (
      SELECT
        id
      FROM
        auth.users
      WHERE
        email = 'tricologist@gmail.com'
    ),
    'fernanda_almeida',
    'fernanda almeida',
    (
      SELECT
        id
      FROM
        clinics
      WHERE
        name = 'clinica teste'
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
        name = 'clinica teste'
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
        name = 'clinica teste'
    )
  );