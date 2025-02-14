PGDMP     *            	        {            otopark veritabani    14.4    14.4     
           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16395    otopark veritabani    DATABASE     q   CREATE DATABASE "otopark veritabani" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Turkish_Turkey.1254';
 $   DROP DATABASE "otopark veritabani";
                postgres    false            �            1259    16418 
   arac_cikis    TABLE     �   CREATE TABLE public.arac_cikis (
    id integer NOT NULL,
    plaka_id character varying,
    cikis_tarihi timestamp without time zone
);
    DROP TABLE public.arac_cikis;
       public         heap    postgres    false            �            1259    16486    arac_cikis_id_seq    SEQUENCE     �   ALTER TABLE public.arac_cikis ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.arac_cikis_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    212            �            1259    16396 
   arac_giris    TABLE     �   CREATE TABLE public.arac_giris (
    arac_sahibi text,
    id integer NOT NULL,
    plaka_id character varying,
    arac_marka character varying,
    giris_tarihi timestamp without time zone
);
    DROP TABLE public.arac_giris;
       public         heap    postgres    false            �            1259    16490    arac_giris_id_seq    SEQUENCE     �   ALTER TABLE public.arac_giris ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.arac_giris_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    209            �            1259    16413    plaka    TABLE     G   CREATE TABLE public.plaka (
    plaka_id character varying NOT NULL
);
    DROP TABLE public.plaka;
       public         heap    postgres    false            �            1259    16408    ucret    TABLE     �  CREATE TABLE public.ucret (
    "<1saat" character varying(255),
    "1 saat" character varying(255),
    "1-2 saat" character varying(255),
    "2-3 saat" character varying(255),
    "3-4 saat" character varying(255),
    "4-12 saat" character varying(255),
    "12-24 saat" character varying(255),
    "24 saat" character varying(255),
    id integer NOT NULL,
    plaka_id character varying
);
    DROP TABLE public.ucret;
       public         heap    postgres    false            �            1259    16496    ucret_id_seq    SEQUENCE     �   ALTER TABLE public.ucret ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.ucret_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    210                      0    16418 
   arac_cikis 
   TABLE DATA           @   COPY public.arac_cikis (id, plaka_id, cikis_tarihi) FROM stdin;
    public          postgres    false    212   �                 0    16396 
   arac_giris 
   TABLE DATA           Y   COPY public.arac_giris (arac_sahibi, id, plaka_id, arac_marka, giris_tarihi) FROM stdin;
    public          postgres    false    209   1                 0    16413    plaka 
   TABLE DATA           )   COPY public.plaka (plaka_id) FROM stdin;
    public          postgres    false    211   �                 0    16408    ucret 
   TABLE DATA           �   COPY public.ucret ("<1saat", "1 saat", "1-2 saat", "2-3 saat", "3-4 saat", "4-12 saat", "12-24 saat", "24 saat", id, plaka_id) FROM stdin;
    public          postgres    false    210   �                  0    0    arac_cikis_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.arac_cikis_id_seq', 13, true);
          public          postgres    false    213                       0    0    arac_giris_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.arac_giris_id_seq', 19, true);
          public          postgres    false    214                       0    0    ucret_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.ucret_id_seq', 14, true);
          public          postgres    false    215            q           2606    16509    arac_cikis arac_cikis_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.arac_cikis
    ADD CONSTRAINT arac_cikis_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.arac_cikis DROP CONSTRAINT arac_cikis_pkey;
       public            postgres    false    212            k           2606    16513    arac_giris arac_giris_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.arac_giris
    ADD CONSTRAINT arac_giris_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.arac_giris DROP CONSTRAINT arac_giris_pkey;
       public            postgres    false    209            o           2606    16533    plaka plaka_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.plaka
    ADD CONSTRAINT plaka_pkey PRIMARY KEY (plaka_id);
 :   ALTER TABLE ONLY public.plaka DROP CONSTRAINT plaka_pkey;
       public            postgres    false    211            m           2606    16526    ucret ucret_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.ucret
    ADD CONSTRAINT ucret_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.ucret DROP CONSTRAINT ucret_pkey;
       public            postgres    false    210            r           1259    16541    fki_plaka_id    INDEX     G   CREATE INDEX fki_plaka_id ON public.arac_cikis USING btree (plaka_id);
     DROP INDEX public.fki_plaka_id;
       public            postgres    false    212            u           2606    16536    arac_cikis plaka_id    FK CONSTRAINT     y   ALTER TABLE ONLY public.arac_cikis
    ADD CONSTRAINT plaka_id FOREIGN KEY (plaka_id) REFERENCES public.plaka(plaka_id);
 =   ALTER TABLE ONLY public.arac_cikis DROP CONSTRAINT plaka_id;
       public          postgres    false    212    3183    211            s           2606    16543    arac_giris plaka_id    FK CONSTRAINT     y   ALTER TABLE ONLY public.arac_giris
    ADD CONSTRAINT plaka_id FOREIGN KEY (plaka_id) REFERENCES public.plaka(plaka_id);
 =   ALTER TABLE ONLY public.arac_giris DROP CONSTRAINT plaka_id;
       public          postgres    false    211    209    3183            t           2606    16548    ucret plaka_id    FK CONSTRAINT     t   ALTER TABLE ONLY public.ucret
    ADD CONSTRAINT plaka_id FOREIGN KEY (plaka_id) REFERENCES public.plaka(plaka_id);
 8   ALTER TABLE ONLY public.ucret DROP CONSTRAINT plaka_id;
       public          postgres    false    210    211    3183               N   x�U̱�0C��n
0�/JNЅRP�� 
$w������(�#�D���g���@�����K��(��e���oߠ�         h   x�K���44"]G']SCΒ����DN###]s]#sK+ �JNL�I�4��47�	�563Ţ�� �:�����В��L�1B������7�\��=... �@Q         +   x�34�ut�554�20�u��560�27�	�563����� }D�         m   x�}�;� ��ޥ���pbp������B�IC����d�ȶ
��C��E����A��}�Qڞ�����t�N2���q¼``����yCG?!oc)�b�:�u"J�     