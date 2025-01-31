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
    ) (
        SELECT
            '00000000-0000-0000-0000-000000000000',
            uuid_generate_v4 (),
            'authenticated',
            'authenticated',
            'user_' ||(ROW_NUMBER() OVER ()) || '@example.com',
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
        FROM
            generate_series(1, 3)
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
    ) (
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
            auth.users
    );

INSERT INTO
    public.profiles (id, username, full_name)
SELECT
    id,
    split_part(email, '@', 1) AS username,
    split_part(email, '_', 1) || ' ' || split_part(split_part(email, '_', 2), '@', 1) AS full_name
FROM
    auth.users;