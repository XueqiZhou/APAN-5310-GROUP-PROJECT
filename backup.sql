PGDMP                         {           5310_test_7    15.2 (Debian 15.2-1.pgdg110+1)    15.1 P    u           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            v           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            w           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            x           1262    100221    5310_test_7    DATABASE     x   CREATE DATABASE "5310_test_7" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';
    DROP DATABASE "5310_test_7";
                postgres    false            �            1259    100231 	   addresses    TABLE     5  CREATE TABLE public.addresses (
    address_id character varying(255) NOT NULL,
    address_line1 character varying(255),
    address_line2 character varying(255),
    city_name character varying(255),
    state character varying(255),
    country character varying(255),
    zipcode character varying(10)
);
    DROP TABLE public.addresses;
       public         heap    postgres    false            �            1259    100461 	   airplanes    TABLE     �   CREATE TABLE public.airplanes (
    airplane_id bigint,
    aircraft_type text,
    manufacturer text,
    model text,
    number_of_seats bigint,
    company_id bigint
);
    DROP TABLE public.airplanes;
       public         heap    postgres    false            �            1259    100248 	   companies    TABLE     �  CREATE TABLE public.companies (
    company_id integer NOT NULL,
    type character varying(20),
    company_name character varying(100),
    membership_status character varying(50),
    description_text character varying(255),
    CONSTRAINT companies_type_check CHECK (((type)::text = ANY ((ARRAY['hotel'::character varying, 'car rental'::character varying, 'airline'::character varying])::text[])))
);
    DROP TABLE public.companies;
       public         heap    postgres    false            �            1259    100247    companies_company_id_seq    SEQUENCE     �   CREATE SEQUENCE public.companies_company_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.companies_company_id_seq;
       public          postgres    false    220            y           0    0    companies_company_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.companies_company_id_seq OWNED BY public.companies.company_id;
          public          postgres    false    219            �            1259    100292    destination_cities    TABLE     t   CREATE TABLE public.destination_cities (
    city_id character(3) NOT NULL,
    city_name character varying(255)
);
 &   DROP TABLE public.destination_cities;
       public         heap    postgres    false            �            1259    100456    flight_passenger    TABLE     �   CREATE TABLE public.flight_passenger (
    flight_reservation_id bigint,
    first_name text,
    last_name text,
    identity_number bigint
);
 $   DROP TABLE public.flight_passenger;
       public         heap    postgres    false            �            1259    100448    flight_reservation    TABLE     �   CREATE TABLE public.flight_reservation (
    flight_reservation_id bigint,
    user_id bigint,
    price_per_ticket double precision,
    tickets_purchased bigint
);
 &   DROP TABLE public.flight_reservation;
       public         heap    postgres    false            �            1259    100451    flight_segment    TABLE     �   CREATE TABLE public.flight_segment (
    flight_reservation_id bigint,
    flight_number text,
    city_dept text,
    city_arvl text,
    airplane_id bigint,
    take_off_date text,
    flight_time double precision,
    seat_type text
);
 "   DROP TABLE public.flight_segment;
       public         heap    postgres    false            �            1259    100277    hotel_reservation    TABLE     �   CREATE TABLE public.hotel_reservation (
    hotel_reservation_id integer NOT NULL,
    user_id integer,
    room_id integer,
    check_in_date date,
    check_out_date date,
    price_per_night numeric(10,2)
);
 %   DROP TABLE public.hotel_reservation;
       public         heap    postgres    false            �            1259    100276 *   hotel_reservation_hotel_reservation_id_seq    SEQUENCE     �   CREATE SEQUENCE public.hotel_reservation_hotel_reservation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 A   DROP SEQUENCE public.hotel_reservation_hotel_reservation_id_seq;
       public          postgres    false    224            z           0    0 *   hotel_reservation_hotel_reservation_id_seq    SEQUENCE OWNED BY     y   ALTER SEQUENCE public.hotel_reservation_hotel_reservation_id_seq OWNED BY public.hotel_reservation.hotel_reservation_id;
          public          postgres    false    223            �            1259    100297    hotel_reviews    TABLE     �   CREATE TABLE public.hotel_reviews (
    hotel_id integer NOT NULL,
    user_id integer NOT NULL,
    review_date date NOT NULL,
    review_text text,
    rating integer
);
 !   DROP TABLE public.hotel_reviews;
       public         heap    postgres    false            �            1259    100271    hotel_rooms    TABLE     �   CREATE TABLE public.hotel_rooms (
    room_id integer NOT NULL,
    hotel_id integer,
    room_number integer,
    room_type character varying(255)
);
    DROP TABLE public.hotel_rooms;
       public         heap    postgres    false            �            1259    100239    hotels    TABLE     �   CREATE TABLE public.hotels (
    hotel_id integer NOT NULL,
    hotel_name character varying(255),
    company_id integer,
    address_id character varying(255)
);
    DROP TABLE public.hotels;
       public         heap    postgres    false            �            1259    100238    hotels_hotel_id_seq    SEQUENCE     �   CREATE SEQUENCE public.hotels_hotel_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.hotels_hotel_id_seq;
       public          postgres    false    218            {           0    0    hotels_hotel_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.hotels_hotel_id_seq OWNED BY public.hotels.hotel_id;
          public          postgres    false    217            �            1259    100470    transaction    TABLE       CREATE TABLE public.transaction (
    transaction_id integer,
    hotel_reservation_id double precision,
    vehicle_reservation_id double precision,
    flight_reservation_id bigint,
    user_id bigint,
    payment text,
    transaction_date text,
    cancelled bigint
);
    DROP TABLE public.transaction;
       public         heap    postgres    false            �            1259    100223    users    TABLE     G  CREATE TABLE public.users (
    user_id integer NOT NULL,
    first_name character varying(50),
    last_name character varying(50),
    gender character varying(30),
    dob date,
    email character varying(255),
    phone_number character varying(15),
    credit_card character(20),
    address_id character varying(255)
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    100222    users_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.users_user_id_seq;
       public          postgres    false    215            |           0    0    users_user_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;
          public          postgres    false    214            �            1259    100284    vehicle_reservation    TABLE     k  CREATE TABLE public.vehicle_reservation (
    vehicle_reservation_id integer NOT NULL,
    vin_number character varying(255),
    user_id integer,
    pick_up_time timestamp without time zone,
    return_time timestamp without time zone,
    pick_up_location character varying(255),
    return_location character varying(255),
    price_per_hour numeric(10,2)
);
 '   DROP TABLE public.vehicle_reservation;
       public         heap    postgres    false            �            1259    100283 .   vehicle_reservation_vehicle_reservation_id_seq    SEQUENCE     �   CREATE SEQUENCE public.vehicle_reservation_vehicle_reservation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 E   DROP SEQUENCE public.vehicle_reservation_vehicle_reservation_id_seq;
       public          postgres    false    226            }           0    0 .   vehicle_reservation_vehicle_reservation_id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.vehicle_reservation_vehicle_reservation_id_seq OWNED BY public.vehicle_reservation.vehicle_reservation_id;
          public          postgres    false    225            �            1259    100255    vehicles    TABLE       CREATE TABLE public.vehicles (
    vin_number character varying(255) NOT NULL,
    plate_number character varying(50),
    company_id integer,
    manufacturer character varying(255),
    model character varying(255),
    type character varying(50),
    vehicle_year integer
);
    DROP TABLE public.vehicles;
       public         heap    postgres    false            �           2604    100251    companies company_id    DEFAULT     |   ALTER TABLE ONLY public.companies ALTER COLUMN company_id SET DEFAULT nextval('public.companies_company_id_seq'::regclass);
 C   ALTER TABLE public.companies ALTER COLUMN company_id DROP DEFAULT;
       public          postgres    false    219    220    220            �           2604    100280 &   hotel_reservation hotel_reservation_id    DEFAULT     �   ALTER TABLE ONLY public.hotel_reservation ALTER COLUMN hotel_reservation_id SET DEFAULT nextval('public.hotel_reservation_hotel_reservation_id_seq'::regclass);
 U   ALTER TABLE public.hotel_reservation ALTER COLUMN hotel_reservation_id DROP DEFAULT;
       public          postgres    false    223    224    224            �           2604    100242    hotels hotel_id    DEFAULT     r   ALTER TABLE ONLY public.hotels ALTER COLUMN hotel_id SET DEFAULT nextval('public.hotels_hotel_id_seq'::regclass);
 >   ALTER TABLE public.hotels ALTER COLUMN hotel_id DROP DEFAULT;
       public          postgres    false    218    217    218            �           2604    100226    users user_id    DEFAULT     n   ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);
 <   ALTER TABLE public.users ALTER COLUMN user_id DROP DEFAULT;
       public          postgres    false    214    215    215            �           2604    100287 *   vehicle_reservation vehicle_reservation_id    DEFAULT     �   ALTER TABLE ONLY public.vehicle_reservation ALTER COLUMN vehicle_reservation_id SET DEFAULT nextval('public.vehicle_reservation_vehicle_reservation_id_seq'::regclass);
 Y   ALTER TABLE public.vehicle_reservation ALTER COLUMN vehicle_reservation_id DROP DEFAULT;
       public          postgres    false    225    226    226            a          0    100231 	   addresses 
   TABLE DATA           q   COPY public.addresses (address_id, address_line1, address_line2, city_name, state, country, zipcode) FROM stdin;
    public          postgres    false    216   Hj       q          0    100461 	   airplanes 
   TABLE DATA           q   COPY public.airplanes (airplane_id, aircraft_type, manufacturer, model, number_of_seats, company_id) FROM stdin;
    public          postgres    false    232   �x       e          0    100248 	   companies 
   TABLE DATA           h   COPY public.companies (company_id, type, company_name, membership_status, description_text) FROM stdin;
    public          postgres    false    220   �       l          0    100292    destination_cities 
   TABLE DATA           @   COPY public.destination_cities (city_id, city_name) FROM stdin;
    public          postgres    false    227   ��       p          0    100456    flight_passenger 
   TABLE DATA           i   COPY public.flight_passenger (flight_reservation_id, first_name, last_name, identity_number) FROM stdin;
    public          postgres    false    231   "�       n          0    100448    flight_reservation 
   TABLE DATA           q   COPY public.flight_reservation (flight_reservation_id, user_id, price_per_ticket, tickets_purchased) FROM stdin;
    public          postgres    false    229   R�       o          0    100451    flight_segment 
   TABLE DATA           �   COPY public.flight_segment (flight_reservation_id, flight_number, city_dept, city_arvl, airplane_id, take_off_date, flight_time, seat_type) FROM stdin;
    public          postgres    false    230   8�       i          0    100277    hotel_reservation 
   TABLE DATA           �   COPY public.hotel_reservation (hotel_reservation_id, user_id, room_id, check_in_date, check_out_date, price_per_night) FROM stdin;
    public          postgres    false    224   �       m          0    100297    hotel_reviews 
   TABLE DATA           \   COPY public.hotel_reviews (hotel_id, user_id, review_date, review_text, rating) FROM stdin;
    public          postgres    false    228   ݤ       g          0    100271    hotel_rooms 
   TABLE DATA           P   COPY public.hotel_rooms (room_id, hotel_id, room_number, room_type) FROM stdin;
    public          postgres    false    222   ��       c          0    100239    hotels 
   TABLE DATA           N   COPY public.hotels (hotel_id, hotel_name, company_id, address_id) FROM stdin;
    public          postgres    false    218   �       r          0    100470    transaction 
   TABLE DATA           �   COPY public.transaction (transaction_id, hotel_reservation_id, vehicle_reservation_id, flight_reservation_id, user_id, payment, transaction_date, cancelled) FROM stdin;
    public          postgres    false    233   y�       `          0    100223    users 
   TABLE DATA           z   COPY public.users (user_id, first_name, last_name, gender, dob, email, phone_number, credit_card, address_id) FROM stdin;
    public          postgres    false    215   :�       k          0    100284    vehicle_reservation 
   TABLE DATA           �   COPY public.vehicle_reservation (vehicle_reservation_id, vin_number, user_id, pick_up_time, return_time, pick_up_location, return_location, price_per_hour) FROM stdin;
    public          postgres    false    226   ��       f          0    100255    vehicles 
   TABLE DATA           q   COPY public.vehicles (vin_number, plate_number, company_id, manufacturer, model, type, vehicle_year) FROM stdin;
    public          postgres    false    221   ��       ~           0    0    companies_company_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.companies_company_id_seq', 1, false);
          public          postgres    false    219                       0    0 *   hotel_reservation_hotel_reservation_id_seq    SEQUENCE SET     Y   SELECT pg_catalog.setval('public.hotel_reservation_hotel_reservation_id_seq', 1, false);
          public          postgres    false    223            �           0    0    hotels_hotel_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.hotels_hotel_id_seq', 1, false);
          public          postgres    false    217            �           0    0    users_user_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.users_user_id_seq', 1, false);
          public          postgres    false    214            �           0    0 .   vehicle_reservation_vehicle_reservation_id_seq    SEQUENCE SET     ]   SELECT pg_catalog.setval('public.vehicle_reservation_vehicle_reservation_id_seq', 1, false);
          public          postgres    false    225            �           2606    100237    addresses addresses_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT addresses_pkey PRIMARY KEY (address_id);
 B   ALTER TABLE ONLY public.addresses DROP CONSTRAINT addresses_pkey;
       public            postgres    false    216            �           2606    100254    companies companies_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.companies
    ADD CONSTRAINT companies_pkey PRIMARY KEY (company_id);
 B   ALTER TABLE ONLY public.companies DROP CONSTRAINT companies_pkey;
       public            postgres    false    220            �           2606    100296 *   destination_cities destination_cities_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY public.destination_cities
    ADD CONSTRAINT destination_cities_pkey PRIMARY KEY (city_id);
 T   ALTER TABLE ONLY public.destination_cities DROP CONSTRAINT destination_cities_pkey;
       public            postgres    false    227            �           2606    100282 (   hotel_reservation hotel_reservation_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.hotel_reservation
    ADD CONSTRAINT hotel_reservation_pkey PRIMARY KEY (hotel_reservation_id);
 R   ALTER TABLE ONLY public.hotel_reservation DROP CONSTRAINT hotel_reservation_pkey;
       public            postgres    false    224            �           2606    100303     hotel_reviews hotel_reviews_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY public.hotel_reviews
    ADD CONSTRAINT hotel_reviews_pkey PRIMARY KEY (hotel_id, user_id, review_date);
 J   ALTER TABLE ONLY public.hotel_reviews DROP CONSTRAINT hotel_reviews_pkey;
       public            postgres    false    228    228    228            �           2606    100275    hotel_rooms hotel_rooms_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.hotel_rooms
    ADD CONSTRAINT hotel_rooms_pkey PRIMARY KEY (room_id);
 F   ALTER TABLE ONLY public.hotel_rooms DROP CONSTRAINT hotel_rooms_pkey;
       public            postgres    false    222            �           2606    100246    hotels hotels_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.hotels
    ADD CONSTRAINT hotels_pkey PRIMARY KEY (hotel_id);
 <   ALTER TABLE ONLY public.hotels DROP CONSTRAINT hotels_pkey;
       public            postgres    false    218            �           2606    100333 #   destination_cities unique_city_name 
   CONSTRAINT     c   ALTER TABLE ONLY public.destination_cities
    ADD CONSTRAINT unique_city_name UNIQUE (city_name);
 M   ALTER TABLE ONLY public.destination_cities DROP CONSTRAINT unique_city_name;
       public            postgres    false    227            �           2606    100360    hotel_reservation unique_date_h 
   CONSTRAINT     u   ALTER TABLE ONLY public.hotel_reservation
    ADD CONSTRAINT unique_date_h UNIQUE (user_id, room_id, check_in_date);
 I   ALTER TABLE ONLY public.hotel_reservation DROP CONSTRAINT unique_date_h;
       public            postgres    false    224    224    224            �           2606    100372 !   vehicle_reservation unique_date_v 
   CONSTRAINT     y   ALTER TABLE ONLY public.vehicle_reservation
    ADD CONSTRAINT unique_date_v UNIQUE (user_id, vin_number, pick_up_time);
 K   ALTER TABLE ONLY public.vehicle_reservation DROP CONSTRAINT unique_date_v;
       public            postgres    false    226    226    226            �           2606    100230    users users_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    215            �           2606    100291 ,   vehicle_reservation vehicle_reservation_pkey 
   CONSTRAINT     ~   ALTER TABLE ONLY public.vehicle_reservation
    ADD CONSTRAINT vehicle_reservation_pkey PRIMARY KEY (vehicle_reservation_id);
 V   ALTER TABLE ONLY public.vehicle_reservation DROP CONSTRAINT vehicle_reservation_pkey;
       public            postgres    false    226            �           2606    100261    vehicles vehicles_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.vehicles
    ADD CONSTRAINT vehicles_pkey PRIMARY KEY (vin_number);
 @   ALTER TABLE ONLY public.vehicles DROP CONSTRAINT vehicles_pkey;
       public            postgres    false    221            �           2606    100366 0   hotel_reservation hotel_reservation_room_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.hotel_reservation
    ADD CONSTRAINT hotel_reservation_room_id_fkey FOREIGN KEY (room_id) REFERENCES public.hotel_rooms(room_id);
 Z   ALTER TABLE ONLY public.hotel_reservation DROP CONSTRAINT hotel_reservation_room_id_fkey;
       public          postgres    false    222    3253    224            �           2606    100361 0   hotel_reservation hotel_reservation_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.hotel_reservation
    ADD CONSTRAINT hotel_reservation_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);
 Z   ALTER TABLE ONLY public.hotel_reservation DROP CONSTRAINT hotel_reservation_user_id_fkey;
       public          postgres    false    224    3243    215            �           2606    100393 )   hotel_reviews hotel_reviews_hotel_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.hotel_reviews
    ADD CONSTRAINT hotel_reviews_hotel_id_fkey FOREIGN KEY (hotel_id) REFERENCES public.hotels(hotel_id);
 S   ALTER TABLE ONLY public.hotel_reviews DROP CONSTRAINT hotel_reviews_hotel_id_fkey;
       public          postgres    false    228    218    3247            �           2606    100398 (   hotel_reviews hotel_reviews_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.hotel_reviews
    ADD CONSTRAINT hotel_reviews_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);
 R   ALTER TABLE ONLY public.hotel_reviews DROP CONSTRAINT hotel_reviews_user_id_fkey;
       public          postgres    false    215    3243    228            �           2606    100354 %   hotel_rooms hotel_rooms_hotel_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.hotel_rooms
    ADD CONSTRAINT hotel_rooms_hotel_id_fkey FOREIGN KEY (hotel_id) REFERENCES public.hotels(hotel_id);
 O   ALTER TABLE ONLY public.hotel_rooms DROP CONSTRAINT hotel_rooms_hotel_id_fkey;
       public          postgres    false    222    3247    218            �           2606    100339    hotels hotels_address_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.hotels
    ADD CONSTRAINT hotels_address_id_fkey FOREIGN KEY (address_id) REFERENCES public.addresses(address_id);
 G   ALTER TABLE ONLY public.hotels DROP CONSTRAINT hotels_address_id_fkey;
       public          postgres    false    216    218    3245            �           2606    100334    hotels hotels_company_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.hotels
    ADD CONSTRAINT hotels_company_id_fkey FOREIGN KEY (company_id) REFERENCES public.companies(company_id);
 G   ALTER TABLE ONLY public.hotels DROP CONSTRAINT hotels_company_id_fkey;
       public          postgres    false    220    218    3249            �           2606    100327    users users_address_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_address_id_fkey FOREIGN KEY (address_id) REFERENCES public.addresses(address_id);
 E   ALTER TABLE ONLY public.users DROP CONSTRAINT users_address_id_fkey;
       public          postgres    false    215    3245    216            �           2606    100383 =   vehicle_reservation vehicle_reservation_pick_up_location_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.vehicle_reservation
    ADD CONSTRAINT vehicle_reservation_pick_up_location_fkey FOREIGN KEY (pick_up_location) REFERENCES public.destination_cities(city_name);
 g   ALTER TABLE ONLY public.vehicle_reservation DROP CONSTRAINT vehicle_reservation_pick_up_location_fkey;
       public          postgres    false    226    227    3265            �           2606    100388 <   vehicle_reservation vehicle_reservation_return_location_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.vehicle_reservation
    ADD CONSTRAINT vehicle_reservation_return_location_fkey FOREIGN KEY (return_location) REFERENCES public.destination_cities(city_name);
 f   ALTER TABLE ONLY public.vehicle_reservation DROP CONSTRAINT vehicle_reservation_return_location_fkey;
       public          postgres    false    226    227    3265            �           2606    100378 4   vehicle_reservation vehicle_reservation_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.vehicle_reservation
    ADD CONSTRAINT vehicle_reservation_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);
 ^   ALTER TABLE ONLY public.vehicle_reservation DROP CONSTRAINT vehicle_reservation_user_id_fkey;
       public          postgres    false    226    3243    215            �           2606    100373 7   vehicle_reservation vehicle_reservation_vin_number_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.vehicle_reservation
    ADD CONSTRAINT vehicle_reservation_vin_number_fkey FOREIGN KEY (vin_number) REFERENCES public.vehicles(vin_number);
 a   ALTER TABLE ONLY public.vehicle_reservation DROP CONSTRAINT vehicle_reservation_vin_number_fkey;
       public          postgres    false    3251    221    226            �           2606    100344 !   vehicles vehicles_company_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.vehicles
    ADD CONSTRAINT vehicles_company_id_fkey FOREIGN KEY (company_id) REFERENCES public.companies(company_id);
 K   ALTER TABLE ONLY public.vehicles DROP CONSTRAINT vehicles_company_id_fkey;
       public          postgres    false    3249    220    221            a   =  x��YIS�L>K�B��e���Ȓ��@(ȗ�Tͥ��A�<������V� ^��X��~�gi�B[��Ͻ��muӻ��}u��׾�V�OD���׋�G�m���O��������ڭ�PH)�.Y��R�Ϻ���U_��� �w�A�v�6�;s}���n0�e%/�������-��=<Գ��NV�VT�"���	��zx��KqUC��Z�;A�VT����HUݺe7T7n�cN�K�R��f{����qQ\���_]���$aq�e�W7tmu��Ø!#d:�*>�a]����[�y����}\w�NXN���*$W�W��K=Tߺ9��Q5GT׸߮�/~y����	%�T�ԅ��:[���>�48�"!,E��HS��z��vK����0����\Xf�{W�u�~��M��=��ʣ�sW���Y���!%T��Pg��f��K�R�E�S��7�Д42��[���hIIazq{q��q��bXZ\�޷+D+n|������!EIi!���C5�Y���T��=�"�A����ow!�a%e��B ��k}���5cN�p�m���Ǽ}��E���dIya�դ�جg�p�[@:���5J���৮v���V%�"0��2V�|�L��v�s�������Y���Z	��&C$�d���nѹfH0��ӳL�'?��.܋�w�1k�)�h��R���1);�Lq��!���c�>5]_��@�	����XY}�뙫N�}���ƥ�G�v��;��{�?��]ofO{}$\�Bj�0���@3��|]�:�Z��������R �E3��Ĵm�ʆ��ap��O�iRv��w�#�����k׻� �V%#����3��+l����7�un� if ���n�1��O�o��VHS2Zh�Tw�w���1����ͺ�=�b��]��V�HJK�P�U?]�J��|j:���y�2�'߷���߱3g����a-�d�`R�1a���O ��)5�ʍ[c�m?��nwE4����W4��n�@{���]$��8�ru�Yw/�Ns)�,�6&`��]]�Ԓ�FR<0R�A|#fTM��Իv�!�%`�7���"�'��m����	�d�I�#4~�>�~�s`�K��<�q����u*1�%v�i�Tuڄz��M@�m�:�nļr}�%�9F��2�:ZՀ�m�5�aژ�%(�Y[D�|�?�v��1��l
h���$������*adۃ��!zt�ia98H�����+�Q��ĤV�J�Iɱ��(<�V7��4�8(��ฃ��~�/~�ߝ>k8�q��]�o�1��X1�t�Jt�{�qwߙC)�%�bmtuٺժ�V?.)�)��-b�@�������\�p���Q�vn�VK�9[,��:�K���C$!8���BC�ݭ|;���)�0d����u/��J�\C8H�8�:���ej) 1���:�� �$� T�Lu�O�L��wh�H�(�3%I0F� ����,V�(�뿻6V��f0�X`��>������6К�>��O����$G-�
~ , )V���:�R�Z5?cFq���w^
�*Xd��a���e�~�QPV�Axfu~\��-)A�a� Eu_�B'd%�H���QF�R�����|����_fA6'��1��T�<�8�JKK!��"T��Q�$���Y)�0~�X��K;���hxD-p&�$�.l�I���<N���{�d eV
a.iu�������
Ly���������a�cX�J�����~����Ӥy��-�w�������:k@��-J{Ad�z�L c����Gz�48,	��Įj(i�8L0�/�07�y^�Q{|�6�p��B����\u��(=�
`��^�G��֋�s�eǌ�*���:��>Z�%@����2"-�k"� �Ab+y�U�=@I�������H�G���&_
�g~�ۡܠ�W0ҹx,� V:Cg��&���E�:���l>�*�� ��WF��w���tA���f_k�	<J�"oo���ʹ��ܭ�?��dl9x�A���� ���@阞?̦��2LO�=�����+��P̐�c�z_�����~J@�ݸo���:VE�-��?�A6��s3`#b.��mԬQ}��aW����T�F� 9�}�?��}�qF���K��Gk�r[*H$j9�H����7n�[��sa����E��┊�Ć��6"�_g��h�Hs��U(ɞ���@&��l�W�>CL|�Dʣ<�􉕄��fƈfSl\�d녌?��5󸶇U����Ͱe�(�g��6�X��L��9tH��L,ި�x_�}N#6��Ȉ�'�h����S}���EG�7Td�b- ev���f���e%��`b�1���2�V�6=(��j{!�E�.(a�����l��R\`V�y��g�w�@�����h5�:�����f��Z&�f�]���x4��(�,5"H����b?��+�h��林� B���ƁgIb�RJH8ݓ,��S��%�N
^T�ŷ��4{ʨ)�'��?F���F���m�t��Z)&����;���;�LK�mu��&a�n��ilR��v�L��pC�aH`�p�����ng������9�t���:^
���`�-�*��Q��)��&J��o�n-.�m�*�M�`p2,P��;�1�bb	~o"�|7.:�T�N���s`����.W�����2Lc�뇇��~��)�$y��l<}�WiFRSh&�d��������
�sG}w�u��C�����(|�0���?l�ɓg��������/<��xRBcj��I����5��~ �E�{��6:p1�opz(�q����8D���򐌀�8��G_#�AJg�S)	��=Y���k��� _���c�<]j��u�w�
x�E�!m������(�Y���B�գU>�v�yii�E�<I�[<�h�g\�E��������B�0L᤺Y����t�B�I0�1�	�/�^Q'n��	X�_ �:�uԕ�J�AYƽ�I�c��A�m6!�jz}7�ċw��1��0%����iɪs�������$�8pZ� J�v�j)���� ��ңh��'�Oه���C�U=�� T����D~k��^_��i(��uď%���K1qh�i�$#36 ��(���Hk��J��N7�+��ݳE�&W.��U�a�������ɝ��7��y&�HX�x@�(�֚�c�?�d�xM�_�&��	Q�u�$�O�B+J`
�r�)�
���f��b�=���[R�1m)ôh���d��N {��{��b�R�)�ײfu��5]����vk�Tn����V���:�OA`1���o�޼6���~r�>�||�����b����\߇��{|.��C����>\���01���@���IA�^y�����*<���;d���㌱�^T�,�yV��j��P�����>���A���TOBd|rr�*<rq����>��q���j:��"�m�w�[� l�u�WN/em�O���>�칶[T|���Gi�<j��6�V�e��(���v0`l�����Oc�8/��ϲ,��+      q   L  x�}Y�r�8<C_�7D�ُ�%?4c�VH�Ql�^�$��	0 Pm��7��~�޹Ȏ�X,Teef��r!�T�I���V�mb��;�&�����:��H�_&O�t/>��N�m�Q!�^I'��Ld��J�8�}ڷ2l�뒝j�q|�ꤲ�R}���m�&}�m���
��E6���b6��V]%������N��{�l+M��5���(s<�Z�
�'x��A[��8�7�"��K�0A����xp�±�g�j��C�*���]]����CtZ5��"�S�MQ�lS�蠑�=���C/6�v�X\!��b!>x�qN>yc;�UF��'�llکZKGm��vPo��ݍ@.H$/
�_���,�ZV/[�	��TR.���2��(���;1_���R<*�T_Ub��}��A�ռ�Ρ���'k���nY���3��V=2�;T*N�� B�h�3=n����Vt�9~��Nt��Y�S� S�Rʠğ�1�"�]����sz��X�C��4�l[͍��m{�|U�N=�~�-�ЬW���D	g�R<�F��~C ?������ y%~غ�I��_ҋ���+��y���|&��4TӍD�`�ZiB��VW��!��:.��5�-2����hw&��G�	������H[;�6����&\&��-6�ڡ����N��y6�YS �8`�BS� �<������g�wP�2yp
/3�s�7(,
�7�U!��4;�� ����GO���I��J��فP[,)B9/�� f�K>��uA�pM�L>�����t���|�e��gي���20�gHh�x��m�����Vjs�<jL��9أRHuG��j	,�J���T�B��W1�nQ��t�	�lPu��຃�B�� J��b�O�@�g�ւ��q��*�|N��h8�£���BF��T׭�	�D�t !���X��˲@uߪt=l6�q߻�z$)SYRq3t�E���b��E�E�Z���D���۫�l��*&8q=��sV��8?�y~Q�bg�\*۶rm���H�b��gE��%�B+H*
���3�v�}`���T>���������|�!��)���(2��FG�C����B;9��2�cF��~c�٢����,�F: 1�*A����Zo;�s�α�wTތ�z�,@u8�R�k*�q����zK��rgE�*Y���K��4F�$5P�[��PS{O�oU����kk_Ċ����\ N7���8(�HMmGq��e��:��{m	�-��~�B���@S�	��v��]�o��F�"�&�v*4���9��{?is��Lb04(/v�~x� y@���EI��gCa�ţ��3�9���jA	S&�m5@(�[pԂ���Q�p�2@�),��h����}�52b�*�s�(Z6�뱤u��J�_U4��DF%E�.��
��V��ґ��'�G�j��7�"�T��P�lF�rUN�D~�!�W�*�5�&�zn��g��J=aT�N�W�jD^����f{�x� ��=��k)[J�i��Vcz���7	�4�703�o6+S�S������5���/%_G>	�U�u��1`;Nt�d�ɘ5�
s�|V��;��2*��Qɽ�k�n��bb��g*[r�E��H�g���p?�ZWȌHw�:�	�jEU�y��Cbƽ".��3���b��S�&�G�3G]��ӆd���S3�Kqg�L� T7���8�3�_��1P~����z=��A�1g�m�?`'!�����e��R�e�8�ա���}�7�W�%�%�`	1=�ڐm�d�*���2��� s��`�
 H�2�Zvt����%tF��� pI��"3P^-��H=���Hi�Q��/e�ņ��l�b��Zŕ��4�Ѕf<l�v @�Z��f��Ͻ!��iq ��S6^XD4Qh���P��+D��,/wz�"�����8����E�rʳ�Gg.hD�H @�6r4P�D�FAn1J���>[� |'���s�����Ӆ��D���<�e��bۨT�l�8)�q���� ��5�b$K���}���U?)O'Z��b>��_l���xT�[���n�
�����C��<0=�O�������u�ϰ�8<�#��U�/�_Pg�Q�-�X24懆�l�f�91����eU���8��D�+ޣQ�rv( �X�I����=��ƍ\��k��b�fp�֓���Q�8��+�?<I���W���L�acF�5��/A@ou,\-��Y���w��ϴJ�$�$���4-��UD1+X�ʓ����'�V�����>*�"��Ӿ��g{���0�c��Z�2�i�;b��U��f����$ـ��M��^�^H7�d�����l�t}X��%4m�pgr`��p_�[�XCdX���0�ƾ���P��dG��g��@��KKlE��.rK8�!��޷�B{5]��������Fyj�X�eN�̳�,��lF��a�[C~Տ(���iI���z��-?�l�+�h�����Or'��[�����qgč�i^��s�t���]�����$Im�X��ىWAQ�44��2~�Q��;��%�d�Y���Z��z��{v�����r�a����BL���țA���	��^�c�O�t��6�e�Z�*� 3�~m==?I�;P�����&�!
oA�sN6���уT0�銃�.�
K��5;��{��]öFZ���"�����Z`� �L_K�*�=+��/7 #�D�>�ȗg��ka
��[Dՠ&��OA��F4r1TeC R� �toJ`������e�,�S�I���
6�K��;�����I�r*�O�F���u DD�O4t9��dq�@y�_ a"e��d�bV} ��\��[㽋z�3f�GŴ#�%q^��uC>���|��i�3��R����[/�dts|�ʟ\���l[��� �0)�JQE;/
��^�H��9�W�*���[���s�+#��������x�}�<�Gְ�j�۩5����-��:}v��z�9��$����:w���a�o1 ��g麩cQ���}7n�w_{r>M�w�>�n7���fvUdQ���`��<5y2�4Eɴ΁���,�Ś7�NN�!�Md��� ^W���*7�l���@�����Hw��/|Dd�+��N�ں�=��=�.n�S+w����3��u�&�ݮ=�����F}��d��g��.��8�<�-����AD͢��5��}���Zbh	��$`g0��mgZ�:���� !Znm�.��~��s��Ǜ:H���h��֤���E��Ć����&��B�3�|��Q����,.8tK����wr����t�����j�$����2��]\\��[3�      e   �  x�M��n�0���S�Rۺǥkr2]�^zad:&"��$'�ۏ
R�GQ��G�C�5A�nS�}����Mg��x���[h��L	�rj�ǥ�	YzY���Qe$ɀ�3���U@0�D�fO�������6��F�R�����c(�}Ϟk+���W`��A3�f�%�
���S�������X y6/N��ӜkΌ�h�M8M�u�oܝ�p�V10ޤ6,f�5��-U$ous���z!�i}�����ݻ�I��۫F�x"��dD��i��к���hL�+����l1���!����Y���Y,Z�8�¹���{���T�cf�r^춷���x%q�m��f�سw������l�"+x�@���E}�!�s����?y��=uT�E�ɜ�ֽ�ι&<�
      l   x   x��1�0��>�O�h��JTQ��|5A22u�R��oy�,t�x�|+B=^��%��ƧA�lj
ΣPV��d��4�K/4��b��M7N�.�Y��$4�㒄
\vs��Ճ�f�X�'#      p      x�UV[O�H~>�cVs�<m��V$�J�}�)�xXہ�_��1�hy���9�ՆVm*O��}_�a"��X]L]_N�ʻǩ�m�^�$���6�h�Oye��2	��[�mǂ�\p�I)\��a?�L��6�MH:X-���r_v�L_�8։l��������e���\�L!H�v��f.�e����c(��N�@�p˩�x��y�\�F$M������I
^F��Љ�c�U�u�ȹ������}����ñ�^�	�����:w������=VR�ZDLt�O�6��2�}��KQ� ��oy�}-������P
�>�g<[�n�)M��h�y��a��p��]>Pt:D1��}����c`
g�6�i�8�h���y��%'���@�,���E`􂦿��u>���b�~aOi�Vw]���=C�;��M"�P�L��8�2T�4$���Pp>IF.�e�h�1��R*i�G7幂�:u�"��D�0�6�����@j�b��q���y|��e�^j���c��<�fR@�$kDg�\C��4)A��A�y*t3ԇ���G��P��:�L��y;�:Lu�����1��4�a]�yϮ��8��8x&��>��0�� E�Y��c�]w�`�Yf
�A�� ��,|&�d���?�e^�,�tA��1����¢�A{��e#��|�́�O�{,)����x���`�Z{�>�;��O�ٲ~PI:��������C�����V�JB���x��-!`���c��H��q�/	0?����� "w5��`J�Ҷk�qS����<��I+���jm�]���	fq6b/a��,��+�,$��YW�?���~� 
J�y@���nn�����c0>�d�C���a���hM
	D	�MH���e�0�5����S�K�0�p+�k��@Ѯ˥?#܁0��8����'V������7�𱟠(-8H�>!�9�VmX�8⹴BE\^�=g׸����(�GPi)ps�ѲIVe�*b�˘_+��tR#���m��i
&����uaTNP�8x�őck���m�?���)`�ݏ��\�2�n ����^	$!���H:���h���d����x��<V�����F�����=}~�a�a�K�T�zˁ�F#إ�c;Ѧ͍\����oҖ����l��]R>����\��U�E	��JR��C��֦˜C�JFt��ѭ�y�����K��v]�:Mc���'-�h1h=4���#�η*�:8��e���x���j�Z��s__�=��nb���l<��6� �f�b$��R�((8���"p(j6�E��@r;��q|,��4�E��¦ d|i���E�g9�B�H:�+d݆���j��R)Bm�M��{�|��⟄�,�?�)J���N�ǌ县��/X���V�S��f�U���c�� Y�r��F���ʔ%xN.�A�B�h(d�(�ln��90��v��),���o�x���AY�T��{�7��Ul2MЄF#�6�=�����?KpէS���|�ۈ�����|�=W��Q���?Y-�(      n   �  x�M�٭# E�M1�Y{���s�ۤH��1w��3,�w?Ӣ�ݰ9�OUe+,z�Ӫ���I���i����ii˲l�Rc�m��t�����ۏǶl��wc����a-����h9i����ek����l������`�i9m��`f+��������6���Zez�.�{��������rY�ܞ�:lw�5>|�oۮ��L�������
�}��^���.�-9����h��+>
���9���%���=e���Ng,�)��O)P��5�K;�CcB��F�=�z�Z��˰>~,�<r7�=�o��>t��8��%��#��@1pw,��*c�e�桼E��C�r���~��%�"p��4��4�d��>�3�_�'�����
G'_�ϙ��#ő�'\'���D�%`�>� �3?��� s^Rlb$�3һ�:hRN�>���I')q?PH��C����Yr���y�F�U�e��K�ȴh����������%Q�m[\�)�ŭ�q�9����~FF��w݈��=�C�~�"��[Z�>��,V�d��z6�;�l��Ǌ�C��Uj����A�����a�����UϸSO<Bᩌ�����a�<�
!�	���9�n����p�{�n	��oƼd]/�7�j$Y����j�+�]W�K��s��P/�f��]���+h�[��f�DA��}����^;ʧ�g����2�I�ퟷ��B��      o   �  x�uW]O#G|n~L��<�Ŝ����%:]��r�(���T����:DB�4����Z���D鸧q ��J�+��"�t������o�|�д=)��v#�k
L��K�F�f���_?�~����C�ۨ���F:�@�\)]ۚ�[Z�.%#mQ�-)73�K�������˅���Xܻ�X�����BO�C���x�Z�C**9@�si��}R*�V�I����k���[`=���ky�+���7���&d���c�Ӫ}{��e��1R�!
\V��m�������(�1��:����ݰ�yw�̖�.��`j��D7����WF�j���t|����,9$���v����2�;�CA��s�^N��aX1�� O��s#���y&N`�R�e%����i��-VZh��Nؔ���&�>6b��(��4:�km��N�N���1�jYʹ�)�_h�?N8Wp�yt8 l�Y9�����e��һEcCw.&?��i�HW�[��W*xI��4-/�Q8Z?h��Xq#�Yt��|�MR�>��,iv�3���)��B�����4����&��P�b���mH'�6�Z���5m����+%���39B�ݲ�\��<�6�v�� 2��hz�d��ܐ��@+u��� ��J�xB'Q5	�	�Z�EY�x��:exu�����5  -�Z�y���;�B��V�yȂ��ʸ��P��`B1d����#?4�;b�<q�H�>�`l��g���"��+�iٕm{�U�y�����:q�2�sQc]���!��H���aJ�q1��d�YM�}t� ��Q��j�w�nf> �p�.��f]ٛ�osI�9�7*M6+>��������[t��&�Ɔ�mX'��z�#ԇ� =���Q���t��8��ATLN�g����>��nrY,HqO�Ŧ����8S�,���7[u���!y1�!�����ƚƓ�L<�?�q��WCq�1�>��>3#��-b fu�dۂ�p�:�������0�������c}����*��~�p����E��&$R]7?��dt�gG��YT�:�ZvNЕ��k���h�:�8�+�U�ฐc�/�.^��J�V7���&��L�i�d�,d�������,�P��s%��3����_����rW�s>j�=A����\�Xil:Ic�n�.ʓ[��ޜ B�Ő���S���9��jB�f�h@Q-�|�|֒�ht<bZ� ����3�|_�����rX(1$N*=�d�ո�1U�4a�Cg�`��;��1g!{iۈ3�8�7>��V���b��B���b wP�N]��YV�^i��%���4=���j�IU6`�roy�_
GT�mpz��cy_P���'����h�:��=���IOT�x�'�O��w�6��B�����/����$/Ysȃ�Mƙ�u��~H1'��q�ӣn�|�ܬ�!��Z�ɕ�Ё0���8  0h.�!�����#F�0�1Yx�g��a�/kgR����p<;��խM%��:��ž)]!�r��@	`��N�8�'xu4ӻ������9����f-���A~N�!?��Q�Y?�do�˹}5������GaCK�aq�A��w� ԢfI��ۿ�1����UM�fr��?���XKo� ��snr�i��,�*9گ����m�3[>R�����gˬH�G`��s:���`���CK&k�n4+^f<����`������n���L�[��6}�ÄD�����������l      i   �  x��ZY��0
�vݥ:��2�?� ��隉�����c]\��/�����/1�zq�s����Un�R��$�q�E�\�Q�ω~�')?����~��5����伨�k��kի�B�O�}�~�q�O6��o�\�%��_)˝�yU��8��{�2�����5I/�&�l�����=�3IR�濻�]K�X���J.�+��-{U�����~����2U'l��BK}�=�o׸�Q|�� ��D��8e����h\����b( ������Gt1��`�AV���G�-媔���A�T�"��&ɰN���^��갆���>B�����C?��=T��B�y�,at{5���?���i��J�j%��YC��1�Rޡ%ӽ���]wyӾ���E1�2�~��r���E����4f�鬮E���P��7lRe�=Q��)����,'9�HD��H�� ÚKS,*�����5b>b5wj'�>�?g]L�־l��.�T��맑��p�T���?l�w�i6�gň埚��f#�'�Pa+�A�8��O���S�ל�e*��+>�߭�M&֪�����Xծ)��n,����+�`�=�����C�@+-�+ș�Sl��I��uuÉ4�r�����TKq�q�dʫ����u��@����}ϽdW�f��	Km˾�!�A����.NZ��pF1Թv��v��-P	ܗO2��I�,�{5�\	���\u��.�1�!�Ȓ�!4<��$�ݎ������^Բ2qh�)�d�WUu��pS�D���3Z��b��rB Ӵ�P�*���7҉Gd�SA�Ū�;�=�x��[��3�� ,P2C'�ӑMθఘH�?ë�)F�w�MDk���LCŃE�K�)�G�-���&X4ﭜ�h�J��9�;ʹ�P�SO(�qwlid�s�i �V�YO�²���T2�4p3a	��{��Dy�Eʹ�#i�U�l��%�s%W���Z�T�a�%qR¹�eq�ǈ+i�QTi)�@&�LQ�.KZIR�p�}�z,��0�;�e���jG��aəK���b�r�)V�8��0�^(�\�/h�M_���/���3|���FR���J��qb�uX��hW3I�%��+�������(�7��D-t�(����+(Ik�ط#Ha#+�[WE���ЛlY��M˚rc�Z���ך׻z��@q��:I̙�~v9&�6�ٙvV,k�����iY�h��KeJ��0QP��t2�4���Qv
?Qv*��ں����	���B �*��2+a���}T^�iF�6/�6	�h��{i���wp&��8�iW�,�]ld�C+��R���*��*a���9\}߭�Х�^m���Z\=���ׁ,�`HME�#a�"׎�p�,8��eg�~C2;��e�
\�޿!G�P��X׼�$7��YWhL8{�1�B�	k��D��vHUG����w�n������k�$�ަb�Ց[�=�'���2��@6��Z�D<��{��E�R^5:��%��f8돚�+k4	`h^�or0���ͽ陼G����W� #��ָѷ2h9ɣo�"�_:W��6�&jܯt+�[d���U����6�L���2��܄ȴ	��?��g��)W1��펙ِ�r��Ȋ<�nWݦQ-��;����g0����L�~m{�) -�n�K������1�d��4z�|w��#9�l�" �J1O���h	h�ߙ�Uhج�f�(h@��u��	y�'F&0�<[=�]k�d���B�X��
j���
���f;�,͎n�W?27c���^Md����n~��F$7.M>���M;K��*��MbA�Q�ˣ'��G~�A0ԙM�g>q�ci(�v����]������"ů���r��m��/�0�[�����&8�3O�)	��[�[�K���JX��|uW=���o�hbX^��벅�L��ay�eY]�|u�`�����G?���٤�5��c��D�^���Z������kF��e�`� �m/�R����iu�Q�g��.]���A�[<��㧵�3X��ޖHl���@T;zFwd�\a���ù��Tƒ�d!5P�UH��l(�^��VR���#������M޺&l#����>o��	��^o�ġ�M��Wƀ��z��[����{�%��XI3�Y�33M%�^�]�z�Y$����'�}��b�D'[���H���m��l.��&W^�k�@H�6�w4|0&�5e6V<}��
ٲ6d<���}�mқ͌�
�_XY�~Oʾ���F
�4��`���"�ٰYѤ��տ�e�,(X(ц��c�Nl��[Qe���r���Y���,7�@Ѽ���,@���ɍ�H�d��cD�B�2!5��u�H�0�gM��a�tU�_؞8,d�GO�wf�B9��9�*5�d�����9��W�'�g�NB�:��&�6�Qz�(P����Y06U�a��!4�­��A�e�8�a<kZl�z�Jsi���P�g? T N,k2,w�nL�aQX�WS<V�����<�Y<x��+�ilM<�x������մ�b�B��h�'f:��7$�#���=���g�{\A�'�'Qt"�9�(-R�dY�`�g���N�	{萡Y��Xk��#��W�d��?{�ai��&��X�4�.��rc_��Jv��#R5�L�"'��8�~���a���@I,>�1�wp3��O���Յ��9�0�L�:;��8ga�����w	����r�y|>����E����G?:������?�V���,�L��˒H֒9�G3�حX�7�U��%�-nl�2ӊ�Wp�Ӭ�}!~&�*�z��GJ�.��D���če֮[ﭳ�K�/(��O��<�
���k���@�\�|����Q=^�.�+�@�g��a3���k��D<_㬃Α�qQ�)�gJO�:����E�dk�42I�|����k7�����xo-��&q�-�/v�3Ą��x�MM�J�w��̒O�x��1��\XV5�|oZg1��W���e���>�T%�:��*��������C�q��C���6+*��~Q���5�2��M6��j_���8[(OubǒI��+K
��?����h>�y�cgZY���!�F�kT��-��L��zV��4h��OR�%z?'{�N;b>��U�P������:A�?�~~~����      m   �  x��[�n��]���Z�:,��T��1`ă�ao�aw�[�PM�dK�W��d�u�#�/�'�޺����� ��H�"����sO�H��"���:N�e&~��]{?wé酌/�g8��pR�é�͖�:�ŗs��L�t�o�-> �<�pz��K����o�ù��u����$\X����$_�m3G�c�k��0F���a5�x?�s�����{��\d1~,����$_�s�����2�`˕�����(�]��?4��r7��'xM!jim��<}�{o)򒞏q��g�(xQ�@��+)�U�����^Ƽ�d�@z�5n�s���/*Qs$%�N7TjQ%��7玕�c���S����L�J��ď�Bd��˗�66c����a�W"����oіB�u���>���K���3�2M���8d���Iw���
�,�t�9:��ͷ�v��������[Ŗ��B��S��������W�$
0i�qZH��!Ү��n������o��p�H� d�s+j�h۶��~��n��Ct��w���7>��`�HS� ��r�2Y� ���$�7f�Bx,E�C��Lp}��R��q�9��v��Z���1��0�|}�ٷ��ԁ�q �=��O�%�����5�hlw��]{ڣ-�dM�GwO�a��w9�W{=��Lx/�
�Ԣ�M��Z�^� ��H�Q\_�k*ũx�5�v��JI%St$�R���ߛ�i`ܐ�*ۼ��J9[��i��-C�8שP�k��	�R߷���V%�Qmj���3;��XϣX3L��0I�����6��␛��VT�#V�6����B�l!��R��T��F�$���y";��	���1ƺ��vG�r�6�7 cl5��F��#p}�G���pR�n� �ne~�*DU�Dϵ5�`����Ƅ,��JGJM�0�3qcm��5i�.P��f<5�f	�5U�J��G~�%,�<�˚�1�R���q��]�ť=�0�g[!��O%���8�R�9��5L�&�C�T@E��v�70�ej6	!xa3�a���Ze��ӈ00�qId#�,���b�,39
AaC��D�����d��a�g��B6���B�_����Nq�!�JÜ��vM=b� ��HvJ�G:Ѕ���͹��=M�K�O)V�"�ؔ 6qD��3���&�J,�A*f�����	}������j���G%��2r�fؕk�]?L*�Br��S� [dZ���V"y��2\LE�<ʲ�.�C1t/���D�,\J�8�"MS�|ߌsw:F���q��q�s�m6��wg�38�ӿWa��F��չ�Aך1��d�<Hr7�,K�j{�����L7X��I"�ܒyI�#�1�>��L�&��[7w�Oh��\qK��t��l�C�� �޶@�Z�Қ]F���%q���l���LV+�ݏ�n�vM�~��J!r��x�3����h8D��۰wZ�O�Z��D�\[ؼ�Wx@�ŁZߕ~�x�@�Q)���U��>9xP�[.�qX��j�EbÎ�o��z�i�!QUjC�8�)�)F*�o��^���{�}R>pI���D�m)M^;�G+,@��Bq�"��0�}3��\А(�^r/�!Ϝ�]�5��=��'Xa7��ꉧ�:h$���x���@�e8����%m��&>f�.�[V�z֒�9	=�lf��zI��E�s�,�ˠ'+�,��V�F��K����?�Z~ (d&��7Ǧ�>���1[_�R�T�^��8���\�46Z�P���P���kJ^�R�*��\����Z�(Q<
�S=S�"ஹ�I����uR�2Og3�u���@/+3,����b?a��Ռ"�K�>8�_�j[YNPr��Ѐr����h�
�e�qi	�+�F���w3��z�kt[������Ub�'�8����DL��=T��f��K�Ȁ:���"<ⴥ�����G��V��=Q�a�	KZ0 ��6��pۂ�[z�冿�m�zD,`K>�x��AE;"�Y�d$���W2!���1~����U�8����=�݆1b����<�c�?)��[I?�gҪDP	G�-����Ӈ���4v���mX@�Q)�隈��c�O.Z[��Uz���vI+.3	�a�|Y�)]��h�
�>�,m�ZX�7�6�*#ȢL+��L� ����p,����+�[r��@��<G�9�
~K��a�0q�~"��)}�cfR',��{X��R���mi��H�۔���[���(sv���p!�5CV��$ea�6��T	����(��f�Ǩ-�
�d����6�V9����LO*�Z:E [@��a�*������y���
3�8�����\m`M�Z�&����]7�'�~�QLeL_���}���`����Vjg)�x?�����;>�n�/�F�QU
� }���E���p>ު]J>3E����7(�/��Wc	j��q����Q�J���p��ϭ+.����/2q7��S�h�m��n�����y�jgg�$�h֗c�~�l,��/^E�_sj���:@���Hg�Bc�TL����S@�F0��W�Q�u:�22��(ib���|�]L��\�cYԞ�p귆�>i*�m�P�/�LW_*qX�R] S4�Ғ�Y��ǭA�L���V돌���/ ^F;+��}x�8��XV����7��<7�ܘٳ`��ti-73���+��Q�]�쭪�T3�0<�z�
T�/[��P�i��cZP��t����R��7Q�`?�h�fdM�(r��v���$��<UC:{��"K�T����4o:�UɿA����4�$�\���T��g�[r;�wif�{�C]����<��N�U��R���OW�3�:�QE�3���%Ra�2�6DN�&F��F�����«��I."Z�v7���؇�\Vw���L�i��Q��<�Fxl���pe�G�b7A�#��i��,�����Ϟ���t}���-T=� E��I�n��X�\eNg����Hz2Wf?�_o�lӍ�-�au�Z#R���Zڛu�,��7�i����s~�7H���W^� �4t��c�N��m*�6��b��%ϣ��	e�M�{sF�%�Q���m�*S!	�G	Z>�&)m�(5 �.*��I��?����&Q���i7=��\�̏*�K����:y��{*����̽1���
��Ս������!�+���/JM?�P��=�Z�w�큢���������:�l��| 5 ��u[#-�{�)���
��!Q���+�F�дr�L�[Xe���r��O��oN���obɹq9�M�ˤ��y��]2��.w�W)�����FW�_8�N�k�^�'�}k.dn&h�F��.>5=)�@D'?�n� K��J�����:�1�S�@o� P�C��N�)xW�Ż����� �g�>�L���_���*��1T,}R���'���t�*c'7�W#N��U���H�ܷ�}��#��/���Jx���d&��j�8Ö������=������LP#�$\O+��Q�0h^���+��|�cy�/��7��?�=���(�$<ձ�!w[�D	%���rNCl���t
A����)�T��xx�zt��}�N�~J�؛�i(�8�P�ρr���~�#�o��E}3	{&�D�JE�L��Z��Giְ��Vj�&N�).�>�oy���6	Kj�_~��Bx:Y
�al��I+�C��p����"}���w\�Vǜ��_x�-G��9��������	��      g   :  x�ET;�1��X�%K}n��V�A�d�j2攄�IYeJi����ߏ�IʚC�������5������'��-��.%��<Qq['�%d�>0�$<�>��:ҁJ{�y��\�u*�����'ɡ'}ɒr�R����r�v��e2���܉��6:;8�)��?�9Ӈ3è�� �3��L`]EܼMRc���`�K&5@_�G1E�=Ɲ>��
27�9�'}a����tT���&z�I`6u^dv&�L/4�7\���F`Yjq�e�'[M[m�^�j{�?tH�l#�k7���	l� p��ɽ�
?��)[~jCYl�ɨ#(��.���`���m�8��u4\̯C@��|�$�ޗ09K�����83��}>f���6�B�D�[OKV�����Fu�Z��+��$N��j'�q���1��p_�Laa� k��#������5�R��>�b��sR�l=3�ڰ84m����b٤�8�d�&}�͙7��k��d{m'7����fA�)_�?'r��wQẾ�G������y�}�[�͸J�E��y�S1j'�V]�$�u����*��^��?��h�      c   a   x�3���/I�Qpr�4�440�2�
8�����a*���\&Pg'N��	�)LE X�)�T 
�7�2��9̀|s.�`,�,a|7�K�=... �"*      r   �  x�}Zˮ%�\�����	�h������8��0�l���")�{$���k����,���Ѯx���ǟ���Ͽ��J!�W�_)_�+]1�����������_�����
����B����}�"a��R�?��W(�V �^	 H��z��/�J׈���_�0!�; ��Ǖ�O��ځ�&|���-#�b|%*2��|�l�8'���((F�x}�DY�v=5J��;b���ez�cjx�����*�)W��n�q��^����$�@X_��j�+��\�硒H"j��gL��`ʷk������yEρ4DJ0i�r��y��k�D��?�C:��`镘
����~�f�b�Vo����U��P����vUjw�wcse蚡	���:�M����y�j��ẑ?����=�`5z��7hO��cᖮ,U��������	��H���C��㕘�pv*ߴ�-�>h�;TM[�if�i�{�y�����M31�Y�KF��Y �"|!R���Dyd��FD���ءV7�w\�3,�Z�����/&��=Kr8�ݕ�E_���Bp�ͤV�i�)�ȵ��	��*��!�_e,�Sr�S��t��
+���Z��&�/�Pf�A�"G�<��[h���d�1h�C0$�����,40 ���9����3�U��]��L@�w����j�u��E9�<�LG��IƬ��+}�/�c㟥�����u8��v1�n�+�W܎Ɵ��CD5�+��Z��ϼ�5�P�R��y�(D ��qX0��+'��$�셑V�H��P~��.�pY�I�0Dޘ�F���Ŕ�b�v�y�@�"2�[�IB#@�6t��LK.	�h�ڇc����������lG¯��<<QR	���:��6�W�hk�}�(u"�X�w(�̍�����`�p>��*Tġ��I��IB ���
H��I��A%s5de9o�<M��[�|�I��ڋU ��S{�V�|4#��
l�`�4+��/��O�e\��`ٽ�xe&$n7M&�3��
qY�Sm(�i�lSM�6����j��|�'��E	�YcE/��)��R�p�n�R@h��a�[#�}y<Ok� ;���T�۫������WV���Y�D��X�c��gTȈ��	�ޅI�I����̂9U3鱓�dF�䵺�R0�Sޏ��#��R'*�5�Hj:I����yd�o���5�ycj�Iy/�M��`]qV�nł��8�¼��q#g-�ܑ������Z�j&�{4R7q$*Z���:�%)��'k������ ��1>y��1��S�t�)�(*�T��1��D��)�Df+����k&�بJ�D�b�aY�";�
R�lYd�daqH}q[�t�H֬=B�[�f#w
��
;kZ�� [r&�`���ř"�Ie��d#E{��H d:b����&Rh�+-[p�D�RH���'� N�CZWa�@^�},ע��>.ɚ��Y5Ά	c�F����ғ4�&��E(������ 6Z�	�|��h��N[ �<#���G�)c�����c�6Ų��[�"���(%}�ܢ�y�k����h��G��V��Jj��Q�Q�mm�s�A`-�X\&�;8�J.�>Gqp�����41��@"ؼ�����gw.�&���Z��6�țM��n������,6�?��ܪR�:��M�d#��6L\�=<����>�	SF#�Pf��<�Jv�&5�f9��؞qO�h;�ᕁ��[���Q��=Ț	ñl�q^YՅu-r�BnUi�b�֕��-WX�Bx���<���0*�"��#Y$.���
Y���O��BY��4L�IK"���zv�x��ȹ�"'Ue��{ʔqO�ՠ��ζ6m{݈9�
��d�N��I���>LWu�[Q�n�T���|U:��e�ۡ*��!��
ɍ)��ֶUr�"�d��0���5���C�nɤ�t�3�GY��J��(m���BG6Q�	�2;t�k��M��+�GjIm8������|7P�t}�$-�2���փ�bQaY^��}S��=n9t���I���Xߚ�b��H�*[�}s+��.�Occ��OF����Dp#<�働�>��E�NHP�d�/�:M���¢
Kr����Y����=
�K< ��[�a�[�k�v�U��Ƶ�(g�Jd&f3�o���M`��\Iz�.��^�;����]S�a��Kn����I>	W��G��� �<7�����Tt}��|	^��=Id�Pˑ&=,��*j-��d�["�U�����3�����y��|�z�M���DA��SX�z�B=;,aPQ��n�D51k�����P��Pl�6�W�b�5n��'��Hi>� ���k ���x,م�#�UHVPsGL�]�75��}���\���^6s���羻7���_����E�K�A����9��ň�ۥ����.)��^sN���䬯�67Lp��<7\m8E��P�߲ì�]�Ԕ�+ps��4�(1ʿ��z���P~�x#��,~�܏�R�8(�C~+^�99�_��&1I��@ΆL_K�󋥴p���F0qD� �~�O��D��6��� q��bv�ga%΍�'MÃT��ӿ�/wfK&*��z}ﭑ>�-��o���Q�2��m�_����R����H��O�9&��n?�ͮSk`�Џ�O�����f�K�}p����T٠�����"�錞v¨����������9)|���!Ed�$�	Yt�G��h��@!�Zi�"�:�����J� RJA]�@��ki<��~�/dޛۺ��]�O=��ٓ>~�6ʣ��Rn�ֳ���E�8S[�*t�uF[�*�}����U��>��f��|�'�j�Y���Q�	~].ߤ�D/�����LaG�F���Y����@qiO���y�4'�������#��&�C�'n������ɕ��Fɇ��#d5�ֹNJo�Qy�ю>����l�AM���"���~lZM��q��l�����.� �Q���%3�C��j	���7����^�z�ۅ1�$��-��B=���%I�,�P���W8e%{�GPW��{�\���wh��A�0~d_�sPO�G�ʳ7>�TG< �z���:�gg{{��Zw��]~J��qZ��
�(�$Q�֢
tBTZ9���'Jb�_~��^�I�氞�0r<�PB��z
�"�"�9�1�t����9�71"u����.��1�Z��1
<GiJc�d>ԮD:�)%!�1H�p��	����Ҟ�����'.��I��J���#�gtEIPNa9�;��f�����}۞:���֏�NŞ�����Z1����	�׶:���Îc�J� ��Z���Xk^�"2[��E=P�n�0e��h��(pL���}+	���D����̪����G��<im�ku�4[�`ҰW��{�����K���n|��K2Z}}���U�      `   a  x�uZɒ�8�]_ѻ^)� �ѳ�l��p���u�$!�)2���rg�"2]����p�9�b�k�#wmI޻�֎�(�H�����ձ�wyא�0\��DsMv��D�X	���?�(',��+�gۖ�T���ˌV;�m$HY����޵n$,R;��N&<~�9�1�ˎ�|������8��ㄴ�b�m쯮�mx�c��5�C�T�еk�����j��5b��(���y6�]n��=�ǎw���{A%y�T5y�X!ί�ҵ�����|pE��&�v'�������)�w���VJ��[RE�G��G�]��j�>��E������N7�) �J��[�>��B�e����5���?-���c�H&�h�2��jr�ym��
���l�$��jW��t���H|&�Lv�$�ckjȻ��ZG����U���K��Ť��V�]?��0��/;6�E�U[������ֳ���b2iǗ����2;�;�h��2F� �p��wm�w�k�u��O3n&�v���<p�*�v�7pz�(��}UW��%�:T`�VOO����	��j��)G��b"}�c�N��8e1y��]_�v _r�@o�&�I4?�&E���5OǪqs�.q�h�L��XL����w�����M� �l)Ҳ�����{�c�fȐ��I��F�Н����\�r1���0��O8Jm*���2E���]���1{��c�V��}�v�Ĳ;�$6;�Ԏ%,vEY��(��B>�ap���Sy�:Nv>�2��"�BI�x��u(9\K�,U��)�L���B.p�$�]Sfȫ)�+G>�U��\O.g��{�-U�=��b�����[CyD�P=��dh�M�f����\�v��8����;�e�9�(g��a+�ҙ�7�rL�S_/Ӎ�����	x����u��>�*?ܴ�V%�~��i���vs�s [�)��i��߭��_]�˪A�5���Y"�6���p�l{Y�~��s�T�rA�{�pH~
����^���pco��6�Ԗ�0�k�gnzA�$��Tzhy]w��>�W ;g�ڥ��6_�E��Z	��Q.)W�s��y�t��ͻ4kj��j;����i���A�Lп�<!�0�mM�m=d¿�T���8����}�8��F|'���x�'�kNu��l�ak`�q��i9پ@��SU��L���4冼�j���	��<cy6_��T,�%�.f	��L<n(���aV�a����T@��aL�ٵ#Pbtk����#����P���Z�����.%�V���mJ�*� �|��u��V�H
1f4�����/��??b�<M�xeyq����=/��plO"B�,7&����q��&ѕ1և���]�-U�0�X��������#>��E]#e/��l�9��d��������x�j,(��sՂ���qܽ /�|1]Ҭƕ%I_�tZ�@%ƒ�
n��G�$Q�-�3k� �ۯP�$��w�t_�Qh�Ɗ��u���o@�{!B�8[X�V-h�r���4���8��&�Ζ���,�Z������\�����l���Elk@�OT{}� OJ���Ǒ�ʕ(���zy�硜*"�`G��|S����jo`q�#�m~�pg�qf��$: bDD#���ڵ�-�e_o�	{�^3��G4(A,u�^��# �ju$�0v���{��v|22����zjDH�q*��#�d˯��V{\	v>nF���0���P�Z��s@�
D��K�G{�eƬ�����? ��x��֮�S�\�1BwTH�a���C���+��H>̅�������2�>�t�_������Ԉ�T`��	~y](��/�p����v%�
ͫb�/��H@���������O�U�*g�1{C�9���5�B��P��w�	 U#�F�-n2��'��Ĳ�Pe+Kؐ�����T���@��7��-j���w6�\ =b�ː���z>����k�[P�kЛ�X�fΫ37�W��	XY �2��A����-t�U�W�,�����q����8U�dTb��	FG��핛i�ʳ��U�sB����>A5	����)9�1��q���hx!*G��� �������i�6�<rS)��
��K�AXW]�l��6y���!��v��$¹��K�܂bBB&@��9�4]���V��a��	8�iE!<��J��xg�o���k���~-�����lw-o&�#J*
��Է�ȇ�}�ǲ�L옶�q8����6��$
QJ�P�ɧ����-
O�6��Vjp,W��8Yt�H�7@H�	�Q��Pp_��A@`����M6_gM�w�-{��1�6jJF��4T�&���WՑ7�T��q�%
bE�&����ϴ�%j^4�Z�"�y_w o@bƗ�7�.m/�]*��rx{ ŊQ�ϟ��m����v��u>�����6���vZx��ߊS���� ��P1�r{h�G\g?�?��"�� ;�B��b��j�Ӂ|tx���x�78<Y�����J�![3S��MU������d��{t�՛��8�`Cz:�f����O!����T)�ګ���MO#���r�u6na/���;VQ���"� wR֡�m�̶��y1�	̵qK?	� ���A&��4y7z5���v�.k����i�Zt���x7�[5���xȻ� �Jσ,���Gy��W��_��1��E�(��3��#
���$Z�����Y��~<A�V<�l���L��+�S7�m����2
�k�r��wNM�~�>=��m�ld�4�߲j����R2_��0�x�l����	�mp��lEa���J��5^Tq8�&�P'����yR���Y=��ʣ���#�Ӫ�^�K�W�Pd@�$�	z�R{��{~�>[Q��b�,}���ԣ�7-���h������#�_��ui��[`y�����y:@W�h�uS,T����I(H���ֿ�����N�[,����m�}�	�r� 4��E�M� �Ů˻���y�Z��}vq�˥���WIB�"m�=t����y��s���Ἴ�b�
$�8�-MA;k}�� S�����0�W7b\�}��B;��P�7�_@��pߝ�[���н\�<Ik�Y.Df&�:�^DGL�K7 �-����D�5ٔ�u���B��m�^�A�
&2 ΚQ����[��w��}���l�ڸ�m�̂"�QҜ���e��;�n�[���]+���M �g"�0&��c���8^�ת(�,�Ԫ��³��*�z�AD�����н��8~������<uy�vM�����cQh��%}�s���l��܈̍�>���d��E�H��Q^�����NȻ��f~�M�0c�V��Z���L�m�ik�b����&�tB!@_�2��w�p�|��|��Ӽ���@2g��	�K��iM!΁�ս�G/�_�&��j�eڞ��b$�:�4�2$���&"�!��[�j�.�������3?��);y氾�6 J�(�G0E�>��o칺�kv��ƫ����k��$U����H_+�������������C�π��|��I��5�B��Yk�~���H�����ďiV�9��
��x�!��615b~u�akO���$7L�<�x��]���ȅ��`����B�޵��xw��*�m;<[e�
Wy��Q���E�=�Q!�b$5��O �v~�7������4?�@ז�U%���@EM��-��}�~����ƞ.w�/�� ���$�h�ֶ3��4�}A����O�~.�ė���6��6�p���E��Y�����
�������06�p�B���oND�j������/e��l�}���c�x����������R���5sL      k   �  x�}Y�nI|n~�~@B]Y��$AJ�@�4�E��^xG��~�FVUW5)i����<"#�d��>~�%�Iy0�I�3�J]�p�̕0k2k)*f�e����������׏�?��|���FސX)�{�d���g�o�e�Z��Ě,�T�_I��d������ޘ�`W�Q����zi�:(�tceqJ�+���`R\I�X2��z���_���¬L#��c&�2��)�EDrG�k%��Z�֦b�Jʌ��ޯ�����=ۖ����w����rhI'l#u6����o�bm\���������_m~�����l��������M.�!�D�()��+�ȊtS�J����~�����_���ɕk��a3�mG����T��h$$��[�\��PW�e����׏�?޲�*�ɳ���i����64!�D_��c���Y_������ѵ�������Yw��Qzm�j�Ξ�ki8W���錕�>�T}��
U���n�j89ﴠ��vT�q��ĐƄU�Kh�ZI�����x�ۓ6���`9;�`�ZQ���q��l5��&��j��e�&�oQV!�!�~<��#�(�YĊ���[�8_��u��$:��S` ='?�M�u-ſI��%���Y������ﶦ%�=in���!�+�QG�bh-.�%��P%��l_���a�>K���*ֿ\�)G�A5c�T�Wy�h%ms�vPJ��kX�/̭*<Lp[J������*c��W��ڽ���ǯ���ԍ�+t�����ص�=!<����AV���Β|�� _6'�W"�`��d0�������aml�(vG����Du6|�����5B��zSو���״0�ř��4�I�W
�՛��6b|�f����Δ�+MJ����8�U�0+�Xo��s�	ӭ#M�*b?��$�&��;�Y�3�-��R�mZr-�suZ9�=k�AY̋	;O[���(�����ԡ�����s�Zrkq�Zu����m��P���l�ݭ{Iј���x�ԉ�H��%�4�YHbu�؀���N���Z!H�4/�Bp���X�X���2
�V�+ꮛ��6��c�Q��8���R�Sk^����d��=��+��Ia��ʶ�Eń#ju�ؘ�#V���6������|/y�]
�� u�
��.3�[㢪O"|5i�~P�Fe�i\e$���a�������MՍ+����@'�'��`_R�!D�W,��aIX6Zg�2*�=u�~wB����f�I��B����.3v13���h���&zGi�����$�$ƣHVL�@I�ycۖ����}�v9l�ЖK!�����a�-�,bgE��2�a��e�=8�5ib$e"X1��!<&cs(�Q�V������I����#g��_��u-dU,��	������y�md��=P�le�E�K��A`Cѓ��dv�>aN��H��f!oUw�>xߢI]�V�i�}Ȳ%b�G3�h_���T�����,��t]�����?�瞼ݴ����I�M���a�P�Z���3V*� 8mDsjoۍ��[�`����P��.a`,���}��UP9�{���m���ɭD����Ŭ�ԓ���Y����ܘ�=�=ѣ"Ah�2�e��ذ.$'�4�D	�����0�݅Ě��?��l�JɊ���QW0���vK7��8uǠ���F��4���Ml9�kU�xd'�K���7��Q�#fP�b6ϻS��B�WW��P�E�WMI�6C ԰o̳�0��Bc-U�����B�nGn7��n�7Xa��(_�Ͻ�ل1ge�z{��[�quv�F=8^���/�v ��T1�%3v17�m${{��!�'�����FR���8��,┱���:��$x��Nj�hhb	T!
�킉�b�;&a��z���)V�[+��V�+Ҽ!�
X1�`�3e�>��1��W�|ׁ{���5�Ӱ��+�� l�Ώ��D��n{�mT[-��qA�{�H��۬ɕ�0��>ag��䡝!0�f�?��v;"l�:GA΋"� �tK�7��}�Aĭ��p���m��j�9m��Y7�z�b��2�a��P��f��@O�ZI����j�y�6T1�˷�0@/�'��㤇q
��+n��-=_I��'���6�~������M�Jc'��47t��Xi�*�;�7�.�04�0t��5�I<�0�"�iG/1�i�>�r���	�mƓR�@�<1\�'��}�t$�͖�J�G�Yf�wj$c)�����#5�|K�'\M�'Ǵ��Y����-�T�#}��-e*��Fe�6#�Y%��m�w;(��OmֻR|<Y��EWFvS���%��HS�h��(�$lYG��7D4ǖĉ8T��zy��`�A_[�Q1/��Sc��s\�����L�؜����
h-�^��7��p�lT�-e	��.�2	��W��-i�#�70*X�Ntw�ӃsJ�:�Q*ހ��׋ڕ���P糣�嫥m���zR
�E�*9���xY`.ޗ"�AY�qgC��[q��>�2�P:x35�����#v�q!�;�%4=X�46=Sϖ*.�ι�� �2v^
gL�dL^�u���@�yr�9� �S�J�ˌ��XƝ��IN�r�\�P����D	����ƘC�j=XML'�0��u,De��\��I&�爕��n+�"��u�5t�K$ϩ��x���Ѷ`�T�Q>�S���£'�&��Ċ�.���.c�q����M7�
�f����]Qı����Ǚ2v�K�ͅ���}i��	�f1���)GG���E�ʌ}�={�r񚹹u~��*DM�`xiM���2�� '�˻����Ik�i/�0"�)y��@j]bEq���}Uo�W�O*fs��)�*e�/(n=W�hRbƾ<Ya3ut�rN�K~<��q�,k��-S���MFa�=�ktK�xq���e�sS����m���_���?�y�͓褁�|#�Bu"�bM��^*�i| ���1���q����`�i��zz0
����B:Z�x��Sr��a�>�#���ܲ9xm������;�iH��6�7�p�.V�H��vc�h���{�T �J]�����ԍaMw���wN ͸���jt�m!lDҲ�C<�`7��,�]��_V8����bF���`�8��ہ�ߩ}y�a��`�>[xA�>�CP�����o��k��*;2a_h!s��*�����7K$�:�y����aR�	+��$;tJ���2�qO������٘�+�ȗ̈́Q�^6'H��;���Q�0�����Ԡ�amq���e%a���M̭��c�Hf/���mdm�xsDy͓%�3?�E��w�� ��O7��cU�_#��%(?�,�݉%��\�o5���ƫ�r=�f���#y�_n��h5c�vo������=����Pj�߅�\;�Jc�B>4���8�[:X���tg��ȇ7���C6���c��m_|C�'�ˣ5���0J\�x�\�K�� ��g��+/8(�fk���Խ��J VK��xf-��3a�}z�Fyp�o���=h�U
�O����N�zw���ɭ�q�Z���3�J      f   �	  x��XIr*I]���󰌌��C
���J�$��P�wU��,}�>I�DB3������&g�ǋ��)c�dV2E��']��#�n{�$��v��#��=ᔙ�ԏ{)sg*)�4����2%������n�:������ΧT��"tE��|)\�Y���Cb��qw�xx�<5-��ce�n%ŕI�n�[�����nuh���ߤ�c��W{�s�m�M�2�8d����������������aE��[8<�|:ĊyR(�Z*j(�N��$�6�Si�tk�eE�e�B�j��M�i;+n�6�C2��u�"���p<�c�M�n�;���N;����9����<4=-G�T����Y!%'�������%���V�D�O��@;U'<��5�*R]��
m}�_���Y�Y��L�u]�k!��,ʐH�q_���_a"��f��-Ҵ�xS!�=�OsC�y��RM���v�%	;���p>a��~MS.�ဟu2��/11�����+*��k�O1��?%*�W���|�q ����=�2a��2O�Ǚj}8 �����ܼi�!��s�DW���k޾)�8q���x8.���M����x野R�[�"�V����y�/=��Xq��i��u�X�}C�����x\��a�X�%��q⮮��ev�KR����qw�K�D��,d�G�`֚Te'��a���D���\��;S_��3xG�՟�	��v���=�+��8GnF4@ѧQ|��Ne��Wa�:�N@�^9Iĩ�KҢ[�b~��=����GVI�f'�~7A6�4�OU���;4	6\��i�iLc��
#7��2�+5*�t���<�S*��4D�o������oH�o�]��Hc3�RG�jG��5���1!㡠�k*��z���5��6�$����ЬR����$��m����Z��b�l���J��2�<��7��<�Y�3m�S��(Ǹc��,���7����aw�GN[<�|Z��dTh�+v��FsB6H�����\>e��.P�?қ��&�<��~��#�63����2n�ŢJ����>�<!�V��J��9�)��I"y#�_*�Ʌr�P������9h�g��.����t�3N���0��j�S���Y��1���f+���]6���|�3)�W�9ˈT�n��>[��w��_�� 6v:�&wxE�ƃ��8�,Jv�sE��ǽd��{�i�X�P��Fe�U�q���O�׉����u:tBj=�cHWNe.Kԉ����(ǝւ��ib���D�Ԡ�̜hIҐ2n8�z�`�~�/h�łM�@"�H�%���t�{�p�^m�K�c�]?�ը�0�����$n��G�x��=Z�^�h>���.G.�)Rr�G�P�����a}�p|��,+#�S�y4����'>^�'�bVkVR�5���a��w�!L�)��fJ���(�3��6�~�G�q�����&�N�_�,����3�8fO��c�nwX�N;J!u���p�mZ�x����ΌcB�y��G�tJ�%��Ap�T'�f���#��"ˣˆ(�B�o�|놿}��Z��.C(		�̲���P�,�c)c�.��?�Isߴ�_D�I�5D�I�"i�}��'+�}�+���䊷'��_	��Q��T!r�	�K���W��qR��X	�HߊD^�o��Ӄ	�3L�	�41��_�n<�
�c�K��	|��}o������'�]��΁�b<0�l\e�C��Ӽl�Z�Gj�%�����=Edvf�8).�TVh_B�D�j����|�MB�
�L�Qm�����
�^
Rq�X��q����ͫq�4Mi� ���F�)�K۳�G#7���?��G>���z �i���@��pc���ޟME@��!-�@�7��C�'��2�Wn���3���C�<����΋4���0KM�n�8kl[�\]�k�ZcZf����7����;:=cs�<o$R��t�f>M��Ƒ�|�D.T�Z*�0'c���_.��E��˜�������f�I\�j(X�C5�11�y�?�6P7[E�	=�D��m��t�Wo*��*&4ewFz�~b�}+��w��f��q$��>
1.�;�/��K����m3�!�
 Y��[�>��3�ӱL�]l��#k�e��E��X��*N3����V�b�J�Ρ�%��ծ}=���r�.E���h���^�wk�՛�j�����H�g�J�y�R�u-	�"�*?����x�H'M�:)Y���Tj�E�ԾL���~԰'.�+cA �HF�fi�Z&�uI?������n���{N�����p���X�����E�+���*�f� |Q%��/ZY�ۻ$,��F���$}�I]h�n1�}]U�a�ǳ1�V.*c�F�>L$����6�����E��������ݞ��Ngy*Q6����̯�v�����t%L[�.z�T��m8,9�o:���Z����(�     