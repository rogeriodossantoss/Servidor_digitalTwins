PGDMP  '                    }            Sistema    17.2    17.2     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            �           1262    16557    Sistema    DATABASE     �   CREATE DATABASE "Sistema" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';
    DROP DATABASE "Sistema";
                     postgres    false            �            1259    57591    Topicos    TABLE     �   CREATE TABLE public."Topicos" (
    id integer NOT NULL,
    topico character varying(255) NOT NULL,
    mensagem character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public."Topicos";
       public         heap r       postgres    false            �            1259    57590    Topicos_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Topicos_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public."Topicos_id_seq";
       public               postgres    false    220            �           0    0    Topicos_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public."Topicos_id_seq" OWNED BY public."Topicos".id;
          public               postgres    false    219            �            1259    16559    usuarios    TABLE       CREATE TABLE public.usuarios (
    id integer NOT NULL,
    nome character varying(255),
    sobrenome character varying(255),
    idade integer,
    email character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public.usuarios;
       public         heap r       postgres    false            �            1259    16558    usuarios_id_seq    SEQUENCE     �   CREATE SEQUENCE public.usuarios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.usuarios_id_seq;
       public               postgres    false    218            �           0    0    usuarios_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.usuarios_id_seq OWNED BY public.usuarios.id;
          public               postgres    false    217            ]           2604    57594 
   Topicos id    DEFAULT     l   ALTER TABLE ONLY public."Topicos" ALTER COLUMN id SET DEFAULT nextval('public."Topicos_id_seq"'::regclass);
 ;   ALTER TABLE public."Topicos" ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    220    219    220            \           2604    16562    usuarios id    DEFAULT     j   ALTER TABLE ONLY public.usuarios ALTER COLUMN id SET DEFAULT nextval('public.usuarios_id_seq'::regclass);
 :   ALTER TABLE public.usuarios ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    217    218    218            �          0    57591    Topicos 
   TABLE DATA           S   COPY public."Topicos" (id, topico, mensagem, "createdAt", "updatedAt") FROM stdin;
    public               postgres    false    220   |       �          0    16559    usuarios 
   TABLE DATA           _   COPY public.usuarios (id, nome, sobrenome, idade, email, "createdAt", "updatedAt") FROM stdin;
    public               postgres    false    218   �       �           0    0    Topicos_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public."Topicos_id_seq"', 54, true);
          public               postgres    false    219                        0    0    usuarios_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.usuarios_id_seq', 5, true);
          public               postgres    false    217            a           2606    57598    Topicos Topicos_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."Topicos"
    ADD CONSTRAINT "Topicos_pkey" PRIMARY KEY (id);
 B   ALTER TABLE ONLY public."Topicos" DROP CONSTRAINT "Topicos_pkey";
       public                 postgres    false    220            _           2606    16566    usuarios usuarios_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usuarios_pkey;
       public                 postgres    false    218            �   �  x���MnS1��2s�(kjy~��6�dAĦ-UZV��t�ANÊ+�W�d�<y�-R�H�&��㱃�������{�rح�no������Ͱ޼���}����"O���+�5����X����D�QL�	�ܜ�@��!>��{K��QDC���f6���lJOb#��ɯ�1|� �>|>����z��z�$��1�@#�M�8�\JƊk�O�_㊑�F������l�Op r�XE �eR�9��ɰ*Hgퟟ?�[��~Ts}���~�^S������B��_�H��G���]�Ck)�l�F�a���p���`\���dL�F���f2b�c,�� �&x��)4,�cJch���F@~�R����%�5�
Ѭ%�;o�r&@�� ��H!��,h�N�me�
�E��m�]l|��]?h�L�Ɓ|m�.�nL-J���۱��"@y�1���ؘ��T��$��@�%��C#`?�`t����kr�y�s��∀yɑKw�h��;�1_ppXr�~�8�;��hT�F�i�����"��ɮ�VUZ�4�Hu�S�/H��'c�i���\.J�!��Bny����
��s<��ŷD�=�0�3|B �9�d��B q�x�T��G#���u��� l�������V��[RV׻�������)n<���8!���i���]��QC �Qp�'�����I� Ь#����E�����z��z*X� �r�Ї�݃��([ �gyE      �   �   x�}�Aj�0EףS���(��JB����U7�c��-A�@��k�bUȦ�NW�������b!My���ﾇ{���V�+"�ѓ�
�+�� 8��p�M����zE���r
xP{t�6ە�?Hx/=㘓�}:�������[�l��x�C���钡ɩk��֜Y�g�y�X�7Y a�3N!�����Nyu'���xr�j7s^ ����o~     