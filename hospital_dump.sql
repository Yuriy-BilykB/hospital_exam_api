PGDMP                      }           hospital_db    17.5    17.5 0    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            �           1262    24576    hospital_db    DATABASE     �   CREATE DATABASE hospital_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Ukrainian_Ukraine.1251';
    DROP DATABASE hospital_db;
                     postgres    false            W           1247    32769    user_role_enum    TYPE     G   CREATE TYPE public.user_role_enum AS ENUM (
    'admin',
    'user'
);
 !   DROP TYPE public.user_role_enum;
       public               postgres    false            �            1259    32802    clinic    TABLE     ]   CREATE TABLE public.clinic (
    id integer NOT NULL,
    name character varying NOT NULL
);
    DROP TABLE public.clinic;
       public         heap r       postgres    false            �            1259    32820    clinic_doctors_doctor    TABLE     p   CREATE TABLE public.clinic_doctors_doctor (
    "clinicId" integer NOT NULL,
    "doctorId" integer NOT NULL
);
 )   DROP TABLE public.clinic_doctors_doctor;
       public         heap r       postgres    false            �            1259    32801    clinic_id_seq    SEQUENCE     �   CREATE SEQUENCE public.clinic_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.clinic_id_seq;
       public               postgres    false    224            �           0    0    clinic_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.clinic_id_seq OWNED BY public.clinic.id;
          public               postgres    false    223            �            1259    32793    doctor    TABLE     �   CREATE TABLE public.doctor (
    id integer NOT NULL,
    "firstName" character varying NOT NULL,
    "lastName" character varying NOT NULL,
    "phoneNumber" character varying NOT NULL,
    email character varying NOT NULL
);
    DROP TABLE public.doctor;
       public         heap r       postgres    false            �            1259    32792    doctor_id_seq    SEQUENCE     �   CREATE SEQUENCE public.doctor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.doctor_id_seq;
       public               postgres    false    222            �           0    0    doctor_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.doctor_id_seq OWNED BY public.doctor.id;
          public               postgres    false    221            �            1259    32784    favor    TABLE     \   CREATE TABLE public.favor (
    id integer NOT NULL,
    name character varying NOT NULL
);
    DROP TABLE public.favor;
       public         heap r       postgres    false            �            1259    32861    favor_doctors_doctor    TABLE     n   CREATE TABLE public.favor_doctors_doctor (
    "favorId" integer NOT NULL,
    "doctorId" integer NOT NULL
);
 (   DROP TABLE public.favor_doctors_doctor;
       public         heap r       postgres    false            �            1259    32783    favor_id_seq    SEQUENCE     �   CREATE SEQUENCE public.favor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.favor_id_seq;
       public               postgres    false    220            �           0    0    favor_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.favor_id_seq OWNED BY public.favor.id;
          public               postgres    false    219            �            1259    32774    user    TABLE     �   CREATE TABLE public."user" (
    id integer NOT NULL,
    name character varying NOT NULL,
    email character varying NOT NULL,
    password character varying NOT NULL,
    role public.user_role_enum DEFAULT 'user'::public.user_role_enum NOT NULL
);
    DROP TABLE public."user";
       public         heap r       postgres    false    855    855            �            1259    32773    user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.user_id_seq;
       public               postgres    false    218            �           0    0    user_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;
          public               postgres    false    217            ?           2604    32805 	   clinic id    DEFAULT     f   ALTER TABLE ONLY public.clinic ALTER COLUMN id SET DEFAULT nextval('public.clinic_id_seq'::regclass);
 8   ALTER TABLE public.clinic ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    223    224    224            >           2604    32796 	   doctor id    DEFAULT     f   ALTER TABLE ONLY public.doctor ALTER COLUMN id SET DEFAULT nextval('public.doctor_id_seq'::regclass);
 8   ALTER TABLE public.doctor ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    222    221    222            =           2604    32787    favor id    DEFAULT     d   ALTER TABLE ONLY public.favor ALTER COLUMN id SET DEFAULT nextval('public.favor_id_seq'::regclass);
 7   ALTER TABLE public.favor ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    219    220    220            ;           2604    32777    user id    DEFAULT     d   ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);
 8   ALTER TABLE public."user" ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    217    218    218            �          0    32802    clinic 
   TABLE DATA           *   COPY public.clinic (id, name) FROM stdin;
    public               postgres    false    224   8       �          0    32820    clinic_doctors_doctor 
   TABLE DATA           G   COPY public.clinic_doctors_doctor ("clinicId", "doctorId") FROM stdin;
    public               postgres    false    225   |8       �          0    32793    doctor 
   TABLE DATA           S   COPY public.doctor (id, "firstName", "lastName", "phoneNumber", email) FROM stdin;
    public               postgres    false    222   �8       �          0    32784    favor 
   TABLE DATA           )   COPY public.favor (id, name) FROM stdin;
    public               postgres    false    220   �9       �          0    32861    favor_doctors_doctor 
   TABLE DATA           E   COPY public.favor_doctors_doctor ("favorId", "doctorId") FROM stdin;
    public               postgres    false    226   �:       �          0    32774    user 
   TABLE DATA           A   COPY public."user" (id, name, email, password, role) FROM stdin;
    public               postgres    false    218   9;       �           0    0    clinic_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.clinic_id_seq', 14, true);
          public               postgres    false    223            �           0    0    doctor_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.doctor_id_seq', 14, true);
          public               postgres    false    221            �           0    0    favor_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.favor_id_seq', 14, true);
          public               postgres    false    219            �           0    0    user_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.user_id_seq', 3, true);
          public               postgres    false    217            C           2606    32791 $   favor PK_193dbf0ea57e1eda4f1586a9659 
   CONSTRAINT     d   ALTER TABLE ONLY public.favor
    ADD CONSTRAINT "PK_193dbf0ea57e1eda4f1586a9659" PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.favor DROP CONSTRAINT "PK_193dbf0ea57e1eda4f1586a9659";
       public                 postgres    false    220            Q           2606    32865 3   favor_doctors_doctor PK_58be86bd39fcba65e7e0d88d674 
   CONSTRAINT     �   ALTER TABLE ONLY public.favor_doctors_doctor
    ADD CONSTRAINT "PK_58be86bd39fcba65e7e0d88d674" PRIMARY KEY ("favorId", "doctorId");
 _   ALTER TABLE ONLY public.favor_doctors_doctor DROP CONSTRAINT "PK_58be86bd39fcba65e7e0d88d674";
       public                 postgres    false    226    226            I           2606    32809 %   clinic PK_8e97c18debc9c7f7606e311d763 
   CONSTRAINT     e   ALTER TABLE ONLY public.clinic
    ADD CONSTRAINT "PK_8e97c18debc9c7f7606e311d763" PRIMARY KEY (id);
 Q   ALTER TABLE ONLY public.clinic DROP CONSTRAINT "PK_8e97c18debc9c7f7606e311d763";
       public                 postgres    false    224            M           2606    32824 4   clinic_doctors_doctor PK_b3f99cb956c38b9004f04596069 
   CONSTRAINT     �   ALTER TABLE ONLY public.clinic_doctors_doctor
    ADD CONSTRAINT "PK_b3f99cb956c38b9004f04596069" PRIMARY KEY ("clinicId", "doctorId");
 `   ALTER TABLE ONLY public.clinic_doctors_doctor DROP CONSTRAINT "PK_b3f99cb956c38b9004f04596069";
       public                 postgres    false    225    225            A           2606    32782 #   user PK_cace4a159ff9f2512dd42373760 
   CONSTRAINT     e   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT "PK_cace4a159ff9f2512dd42373760" PRIMARY KEY (id);
 Q   ALTER TABLE ONLY public."user" DROP CONSTRAINT "PK_cace4a159ff9f2512dd42373760";
       public                 postgres    false    218            E           2606    32800 %   doctor PK_ee6bf6c8de78803212c548fcb94 
   CONSTRAINT     e   ALTER TABLE ONLY public.doctor
    ADD CONSTRAINT "PK_ee6bf6c8de78803212c548fcb94" PRIMARY KEY (id);
 Q   ALTER TABLE ONLY public.doctor DROP CONSTRAINT "PK_ee6bf6c8de78803212c548fcb94";
       public                 postgres    false    222            G           2606    32838 %   doctor UQ_bf6303ac911efaab681dc911f54 
   CONSTRAINT     c   ALTER TABLE ONLY public.doctor
    ADD CONSTRAINT "UQ_bf6303ac911efaab681dc911f54" UNIQUE (email);
 Q   ALTER TABLE ONLY public.doctor DROP CONSTRAINT "UQ_bf6303ac911efaab681dc911f54";
       public                 postgres    false    222            J           1259    32826    IDX_16baca4a1d55c887b503004ade    INDEX     h   CREATE INDEX "IDX_16baca4a1d55c887b503004ade" ON public.clinic_doctors_doctor USING btree ("doctorId");
 4   DROP INDEX public."IDX_16baca4a1d55c887b503004ade";
       public                 postgres    false    225            K           1259    32825    IDX_9eb54900314b95fdf7b5cd601e    INDEX     h   CREATE INDEX "IDX_9eb54900314b95fdf7b5cd601e" ON public.clinic_doctors_doctor USING btree ("clinicId");
 4   DROP INDEX public."IDX_9eb54900314b95fdf7b5cd601e";
       public                 postgres    false    225            N           1259    32866    IDX_b5a39ca3574f0e783e026fbfe6    INDEX     f   CREATE INDEX "IDX_b5a39ca3574f0e783e026fbfe6" ON public.favor_doctors_doctor USING btree ("favorId");
 4   DROP INDEX public."IDX_b5a39ca3574f0e783e026fbfe6";
       public                 postgres    false    226            O           1259    32867    IDX_f7cebcbbdc2380a58390b927a6    INDEX     g   CREATE INDEX "IDX_f7cebcbbdc2380a58390b927a6" ON public.favor_doctors_doctor USING btree ("doctorId");
 4   DROP INDEX public."IDX_f7cebcbbdc2380a58390b927a6";
       public                 postgres    false    226            R           2606    32839 4   clinic_doctors_doctor FK_16baca4a1d55c887b503004ade9    FK CONSTRAINT     �   ALTER TABLE ONLY public.clinic_doctors_doctor
    ADD CONSTRAINT "FK_16baca4a1d55c887b503004ade9" FOREIGN KEY ("doctorId") REFERENCES public.doctor(id);
 `   ALTER TABLE ONLY public.clinic_doctors_doctor DROP CONSTRAINT "FK_16baca4a1d55c887b503004ade9";
       public               postgres    false    225    4677    222            S           2606    32827 4   clinic_doctors_doctor FK_9eb54900314b95fdf7b5cd601e9    FK CONSTRAINT     �   ALTER TABLE ONLY public.clinic_doctors_doctor
    ADD CONSTRAINT "FK_9eb54900314b95fdf7b5cd601e9" FOREIGN KEY ("clinicId") REFERENCES public.clinic(id) ON UPDATE CASCADE ON DELETE CASCADE;
 `   ALTER TABLE ONLY public.clinic_doctors_doctor DROP CONSTRAINT "FK_9eb54900314b95fdf7b5cd601e9";
       public               postgres    false    224    4681    225            T           2606    32868 3   favor_doctors_doctor FK_b5a39ca3574f0e783e026fbfe60    FK CONSTRAINT     �   ALTER TABLE ONLY public.favor_doctors_doctor
    ADD CONSTRAINT "FK_b5a39ca3574f0e783e026fbfe60" FOREIGN KEY ("favorId") REFERENCES public.favor(id) ON UPDATE CASCADE ON DELETE CASCADE;
 _   ALTER TABLE ONLY public.favor_doctors_doctor DROP CONSTRAINT "FK_b5a39ca3574f0e783e026fbfe60";
       public               postgres    false    220    4675    226            U           2606    32873 3   favor_doctors_doctor FK_f7cebcbbdc2380a58390b927a6a    FK CONSTRAINT     �   ALTER TABLE ONLY public.favor_doctors_doctor
    ADD CONSTRAINT "FK_f7cebcbbdc2380a58390b927a6a" FOREIGN KEY ("doctorId") REFERENCES public.doctor(id);
 _   ALTER TABLE ONLY public.favor_doctors_doctor DROP CONSTRAINT "FK_f7cebcbbdc2380a58390b927a6a";
       public               postgres    false    222    226    4677            �   W   x�3�tK��̩T�MM�L��KUpN�+I-�2����,SK-*IM*���O�TH����L�2�H���%��D- �.@�@Ag�`� � �      �   :   x�ʹ 0���b�>�t#�#�����@��Jb��E��M�"T����n9	�      �     x�]�AK�0���ӯ"�$�]{s��Ä�x�]XS�4�뾽MZ!���?<Iv����Oz]����2��\�����2�iX�l&�l]�Hj�J"	�5^�$��4�҄�5�6�r����-�
�Q6��X`Z�u��i���n��1cҕ���8�`���DzH�:O���
/���Dʯ�Y��ʦ�qZcK�7�1��:Ik�e�k�
>�TxSWr���|�K���wM��G���������Q�W�g�OfX��B���t�E,˲?L�m      �   �   x�U��n�@D��W����=Ҁ���K/��JVu���H��T=p������H�Zs�ɓf\§�6Չ��
��FE��T�+�)�Qo��nɚ��Q�k����w��Z[�RRn�L�]Uw_��9lD��qZ{@!��KR��j��+l�zrm�qGn���$�PO*����o��P�      �   �   x�%��C1���ar�G��K��#@Rh���c?A.)2�� � �(�@2��Y$ID"��T��(Es����i��h���!�H��zr	l�%Z�p�pY/���[�R��:]9�������$�      �   �   x�e̱�0@ѹ�f%n�
!P�Ը���*֯׸:ܜ�tR#G�J��V���ЙסG)�2VҦ��t�i/`,��T9m�f���R8zvS�$�$��L�qу��R����?�"v��Xi��SP�ޖqO�q�h��/,�mE�P��X*��j�c�6�<�     