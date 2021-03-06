PGDMP     1    *    	            v           singescaladedb    10.2    10.2 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            �           1262    17542    singescaladedb    DATABASE     �   CREATE DATABASE singescaladedb WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'French_France.1252' LC_CTYPE = 'French_France.1252';
    DROP DATABASE singescaladedb;
             adm_singescalade    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3                        3079    12924    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            �           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    50273    commentaire    TABLE     �   CREATE TABLE commentaire (
    id integer NOT NULL,
    date timestamp without time zone NOT NULL,
    pseudo_auteur character varying(30) NOT NULL,
    alerte boolean NOT NULL,
    spot_id integer NOT NULL
);
    DROP TABLE public.commentaire;
       public         user    false    3            �            1259    50227    departement    TABLE     o   CREATE TABLE departement (
    numero character varying(3) NOT NULL,
    nom character varying(40) NOT NULL
);
    DROP TABLE public.departement;
       public         user    false    3            �            1259    50207 
   difficulte    TABLE     C   CREATE TABLE difficulte (
    nom character varying(2) NOT NULL
);
    DROP TABLE public.difficulte;
       public         user    false    3            �            1259    50201    emprunt    TABLE     �   CREATE TABLE emprunt (
    id integer NOT NULL,
    pseudo_emprunteur character varying(30) NOT NULL,
    exemplaire_topo_id integer NOT NULL,
    debut date NOT NULL,
    fin date NOT NULL
);
    DROP TABLE public.emprunt;
       public         user    false    3            �            1259    50199    emprunt_id_seq    SEQUENCE     p   CREATE SEQUENCE emprunt_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.emprunt_id_seq;
       public       user    false    3    208            �           0    0    emprunt_id_seq    SEQUENCE OWNED BY     3   ALTER SEQUENCE emprunt_id_seq OWNED BY emprunt.id;
            public       user    false    207            �            1259    50193    exemplaire_topo    TABLE     �   CREATE TABLE exemplaire_topo (
    id integer NOT NULL,
    titre_topo character varying(100) NOT NULL,
    pseudo_proprietaire character varying(30) NOT NULL,
    condition_id integer NOT NULL
);
 #   DROP TABLE public.exemplaire_topo;
       public         user    false    3            �            1259    50191    exemplaire_topo_id_seq    SEQUENCE     x   CREATE SEQUENCE exemplaire_topo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.exemplaire_topo_id_seq;
       public       user    false    3    206            �           0    0    exemplaire_topo_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE exemplaire_topo_id_seq OWNED BY exemplaire_topo.id;
            public       user    false    205            �            1259    50217    orientation    TABLE     D   CREATE TABLE orientation (
    nom character varying(2) NOT NULL
);
    DROP TABLE public.orientation;
       public         user    false    3            �            1259    50158 
   paragraphe    TABLE     �   CREATE TABLE paragraphe (
    id integer NOT NULL,
    texte character varying(1000) NOT NULL,
    zone_texte_id integer NOT NULL,
    num_ordre smallint NOT NULL
);
    DROP TABLE public.paragraphe;
       public         user    false    3            �            1259    50156    paragraphe_id_seq    SEQUENCE     s   CREATE SEQUENCE paragraphe_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.paragraphe_id_seq;
       public       user    false    201    3            �           0    0    paragraphe_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE paragraphe_id_seq OWNED BY paragraphe.id;
            public       user    false    200            �            1259    50142    photo    TABLE     a   CREATE TABLE photo (
    id integer NOT NULL,
    nom_fichier character varying(100) NOT NULL
);
    DROP TABLE public.photo;
       public         user    false    3            �            1259    50140    photo_id_seq    SEQUENCE     n   CREATE SEQUENCE photo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.photo_id_seq;
       public       user    false    197    3            �           0    0    photo_id_seq    SEQUENCE OWNED BY     /   ALTER SEQUENCE photo_id_seq OWNED BY photo.id;
            public       user    false    196            �            1259    50248 
   photo_spot    TABLE     Y   CREATE TABLE photo_spot (
    spot_id integer NOT NULL,
    photo_id integer NOT NULL
);
    DROP TABLE public.photo_spot;
       public         user    false    3            �            1259    50181 
   photo_topo    TABLE     k   CREATE TABLE photo_topo (
    titre_topo character varying(100) NOT NULL,
    photo_id integer NOT NULL
);
    DROP TABLE public.photo_topo;
       public         user    false    3            �            1259    50212    profil    TABLE     @   CREATE TABLE profil (
    nom character varying(10) NOT NULL
);
    DROP TABLE public.profil;
       public         user    false    3            �            1259    50242    spot    TABLE     $  CREATE TABLE spot (
    id integer NOT NULL,
    nom character varying(40) NOT NULL,
    pseudo_auteur character varying(30) NOT NULL,
    ouvert boolean NOT NULL,
    adapte_enfants boolean,
    latitude character varying(15),
    longitude character varying(15),
    ville_id integer NOT NULL,
    presentation_id integer,
    nb_secteur smallint,
    nb_voie character varying(50) NOT NULL,
    hauteur_min smallint,
    hauteur_max smallint,
    difficulte_min character varying(2) NOT NULL,
    difficulte_max character varying(2) NOT NULL
);
    DROP TABLE public.spot;
       public         user    false    3            �            1259    50240    spot_id_seq    SEQUENCE     m   CREATE SEQUENCE spot_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.spot_id_seq;
       public       user    false    3    217            �           0    0    spot_id_seq    SEQUENCE OWNED BY     -   ALTER SEQUENCE spot_id_seq OWNED BY spot.id;
            public       user    false    216            �            1259    50258    spot_orientation    TABLE     o   CREATE TABLE spot_orientation (
    spot_id integer NOT NULL,
    orientation character varying(2) NOT NULL
);
 $   DROP TABLE public.spot_orientation;
       public         user    false    3            �            1259    50253    spot_profil    TABLE     f   CREATE TABLE spot_profil (
    spot_id integer NOT NULL,
    profil character varying(10) NOT NULL
);
    DROP TABLE public.spot_profil;
       public         user    false    3            �            1259    50268 	   spot_topo    TABLE     d   CREATE TABLE spot_topo (
    spot_id integer NOT NULL,
    titre character varying(100) NOT NULL
);
    DROP TABLE public.spot_topo;
       public         user    false    3            �            1259    50263 	   spot_type    TABLE     b   CREATE TABLE spot_type (
    type character varying(10) NOT NULL,
    spot_id integer NOT NULL
);
    DROP TABLE public.spot_type;
       public         user    false    3            �            1259    50176    topo    TABLE     f   CREATE TABLE topo (
    titre character varying(100) NOT NULL,
    description_id integer NOT NULL
);
    DROP TABLE public.topo;
       public         user    false    3            �            1259    50222    type    TABLE     >   CREATE TABLE type (
    nom character varying(10) NOT NULL
);
    DROP TABLE public.type;
       public         user    false    3            �            1259    50186    utilisateur    TABLE       CREATE TABLE utilisateur (
    pseudo character varying(30) NOT NULL,
    mail character varying(200) NOT NULL,
    mdp character varying(100) NOT NULL,
    avatar character varying(100),
    admin boolean NOT NULL,
    sel character varying(20) NOT NULL
);
    DROP TABLE public.utilisateur;
       public         user    false    3            �            1259    50234    ville    TABLE     �   CREATE TABLE ville (
    id integer NOT NULL,
    cp character varying(5) NOT NULL,
    departement character varying(3) NOT NULL,
    nom character varying(40) NOT NULL
);
    DROP TABLE public.ville;
       public         user    false    3            �            1259    50232    ville_id_seq    SEQUENCE     n   CREATE SEQUENCE ville_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.ville_id_seq;
       public       user    false    215    3            �           0    0    ville_id_seq    SEQUENCE OWNED BY     /   ALTER SEQUENCE ville_id_seq OWNED BY ville.id;
            public       user    false    214            �            1259    50150 
   zone_texte    TABLE     `   CREATE TABLE zone_texte (
    id integer NOT NULL,
    titre character varying(100) NOT NULL
);
    DROP TABLE public.zone_texte;
       public         user    false    3            �            1259    50148    zone_texte_id_seq    SEQUENCE     s   CREATE SEQUENCE zone_texte_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.zone_texte_id_seq;
       public       user    false    199    3            �           0    0    zone_texte_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE zone_texte_id_seq OWNED BY zone_texte.id;
            public       user    false    198            �
           2604    50204 
   emprunt id    DEFAULT     Z   ALTER TABLE ONLY emprunt ALTER COLUMN id SET DEFAULT nextval('emprunt_id_seq'::regclass);
 9   ALTER TABLE public.emprunt ALTER COLUMN id DROP DEFAULT;
       public       user    false    207    208    208            �
           2604    50196    exemplaire_topo id    DEFAULT     j   ALTER TABLE ONLY exemplaire_topo ALTER COLUMN id SET DEFAULT nextval('exemplaire_topo_id_seq'::regclass);
 A   ALTER TABLE public.exemplaire_topo ALTER COLUMN id DROP DEFAULT;
       public       user    false    206    205    206            �
           2604    50161    paragraphe id    DEFAULT     `   ALTER TABLE ONLY paragraphe ALTER COLUMN id SET DEFAULT nextval('paragraphe_id_seq'::regclass);
 <   ALTER TABLE public.paragraphe ALTER COLUMN id DROP DEFAULT;
       public       user    false    200    201    201            �
           2604    50145    photo id    DEFAULT     V   ALTER TABLE ONLY photo ALTER COLUMN id SET DEFAULT nextval('photo_id_seq'::regclass);
 7   ALTER TABLE public.photo ALTER COLUMN id DROP DEFAULT;
       public       user    false    197    196    197            �
           2604    50245    spot id    DEFAULT     T   ALTER TABLE ONLY spot ALTER COLUMN id SET DEFAULT nextval('spot_id_seq'::regclass);
 6   ALTER TABLE public.spot ALTER COLUMN id DROP DEFAULT;
       public       user    false    216    217    217            �
           2604    50237    ville id    DEFAULT     V   ALTER TABLE ONLY ville ALTER COLUMN id SET DEFAULT nextval('ville_id_seq'::regclass);
 7   ALTER TABLE public.ville ALTER COLUMN id DROP DEFAULT;
       public       user    false    215    214    215            �
           2604    50153    zone_texte id    DEFAULT     `   ALTER TABLE ONLY zone_texte ALTER COLUMN id SET DEFAULT nextval('zone_texte_id_seq'::regclass);
 <   ALTER TABLE public.zone_texte ALTER COLUMN id DROP DEFAULT;
       public       user    false    198    199    199            �          0    50273    commentaire 
   TABLE DATA               H   COPY commentaire (id, date, pseudo_auteur, alerte, spot_id) FROM stdin;
    public       user    false    223   ��       �          0    50227    departement 
   TABLE DATA               +   COPY departement (numero, nom) FROM stdin;
    public       user    false    213   ��       �          0    50207 
   difficulte 
   TABLE DATA               "   COPY difficulte (nom) FROM stdin;
    public       user    false    209   �       �          0    50201    emprunt 
   TABLE DATA               Q   COPY emprunt (id, pseudo_emprunteur, exemplaire_topo_id, debut, fin) FROM stdin;
    public       user    false    208   X�       �          0    50193    exemplaire_topo 
   TABLE DATA               U   COPY exemplaire_topo (id, titre_topo, pseudo_proprietaire, condition_id) FROM stdin;
    public       user    false    206   ��       �          0    50217    orientation 
   TABLE DATA               #   COPY orientation (nom) FROM stdin;
    public       user    false    211   ސ       �          0    50158 
   paragraphe 
   TABLE DATA               B   COPY paragraphe (id, texte, zone_texte_id, num_ordre) FROM stdin;
    public       user    false    201   �       �          0    50142    photo 
   TABLE DATA               )   COPY photo (id, nom_fichier) FROM stdin;
    public       user    false    197   *�       �          0    50248 
   photo_spot 
   TABLE DATA               0   COPY photo_spot (spot_id, photo_id) FROM stdin;
    public       user    false    218   ��       �          0    50181 
   photo_topo 
   TABLE DATA               3   COPY photo_topo (titre_topo, photo_id) FROM stdin;
    public       user    false    203   ��       �          0    50212    profil 
   TABLE DATA                  COPY profil (nom) FROM stdin;
    public       user    false    210   5�       �          0    50242    spot 
   TABLE DATA               �   COPY spot (id, nom, pseudo_auteur, ouvert, adapte_enfants, latitude, longitude, ville_id, presentation_id, nb_secteur, nb_voie, hauteur_min, hauteur_max, difficulte_min, difficulte_max) FROM stdin;
    public       user    false    217   r�       �          0    50258    spot_orientation 
   TABLE DATA               9   COPY spot_orientation (spot_id, orientation) FROM stdin;
    public       user    false    220   ĕ       �          0    50253    spot_profil 
   TABLE DATA               /   COPY spot_profil (spot_id, profil) FROM stdin;
    public       user    false    219   R�       �          0    50268 	   spot_topo 
   TABLE DATA               ,   COPY spot_topo (spot_id, titre) FROM stdin;
    public       user    false    222   �       �          0    50263 	   spot_type 
   TABLE DATA               +   COPY spot_type (type, spot_id) FROM stdin;
    public       user    false    221   q�       �          0    50176    topo 
   TABLE DATA               .   COPY topo (titre, description_id) FROM stdin;
    public       user    false    202   ȗ       �          0    50222    type 
   TABLE DATA                  COPY type (nom) FROM stdin;
    public       user    false    212    �       �          0    50186    utilisateur 
   TABLE DATA               E   COPY utilisateur (pseudo, mail, mdp, avatar, admin, sel) FROM stdin;
    public       user    false    204   *�       �          0    50234    ville 
   TABLE DATA               2   COPY ville (id, cp, departement, nom) FROM stdin;
    public       user    false    215   Y�       �          0    50150 
   zone_texte 
   TABLE DATA               (   COPY zone_texte (id, titre) FROM stdin;
    public       user    false    199   �       �           0    0    emprunt_id_seq    SEQUENCE SET     5   SELECT pg_catalog.setval('emprunt_id_seq', 2, true);
            public       user    false    207            �           0    0    exemplaire_topo_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('exemplaire_topo_id_seq', 1, true);
            public       user    false    205            �           0    0    paragraphe_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('paragraphe_id_seq', 5, true);
            public       user    false    200            �           0    0    photo_id_seq    SEQUENCE SET     4   SELECT pg_catalog.setval('photo_id_seq', 1, false);
            public       user    false    196            �           0    0    spot_id_seq    SEQUENCE SET     3   SELECT pg_catalog.setval('spot_id_seq', 17, true);
            public       user    false    216            �           0    0    ville_id_seq    SEQUENCE SET     3   SELECT pg_catalog.setval('ville_id_seq', 7, true);
            public       user    false    214            �           0    0    zone_texte_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('zone_texte_id_seq', 4, true);
            public       user    false    198            �
           2606    50277    commentaire commentaire_pk 
   CONSTRAINT     Q   ALTER TABLE ONLY commentaire
    ADD CONSTRAINT commentaire_pk PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.commentaire DROP CONSTRAINT commentaire_pk;
       public         user    false    223            �
           2606    50231    departement departement_pk 
   CONSTRAINT     U   ALTER TABLE ONLY departement
    ADD CONSTRAINT departement_pk PRIMARY KEY (numero);
 D   ALTER TABLE ONLY public.departement DROP CONSTRAINT departement_pk;
       public         user    false    213            �
           2606    50211    difficulte difficulte_pk 
   CONSTRAINT     P   ALTER TABLE ONLY difficulte
    ADD CONSTRAINT difficulte_pk PRIMARY KEY (nom);
 B   ALTER TABLE ONLY public.difficulte DROP CONSTRAINT difficulte_pk;
       public         user    false    209            �
           2606    50206    emprunt emprunt_pk 
   CONSTRAINT     I   ALTER TABLE ONLY emprunt
    ADD CONSTRAINT emprunt_pk PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.emprunt DROP CONSTRAINT emprunt_pk;
       public         user    false    208            �
           2606    50198 "   exemplaire_topo exemplaire_topo_pk 
   CONSTRAINT     Y   ALTER TABLE ONLY exemplaire_topo
    ADD CONSTRAINT exemplaire_topo_pk PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.exemplaire_topo DROP CONSTRAINT exemplaire_topo_pk;
       public         user    false    206            �
           2606    50221    orientation orientation_pk 
   CONSTRAINT     R   ALTER TABLE ONLY orientation
    ADD CONSTRAINT orientation_pk PRIMARY KEY (nom);
 D   ALTER TABLE ONLY public.orientation DROP CONSTRAINT orientation_pk;
       public         user    false    211            �
           2606    50166    paragraphe paragraphe_pk 
   CONSTRAINT     O   ALTER TABLE ONLY paragraphe
    ADD CONSTRAINT paragraphe_pk PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.paragraphe DROP CONSTRAINT paragraphe_pk;
       public         user    false    201            �
           2606    50147    photo photo_pk 
   CONSTRAINT     E   ALTER TABLE ONLY photo
    ADD CONSTRAINT photo_pk PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.photo DROP CONSTRAINT photo_pk;
       public         user    false    197            �
           2606    50252    photo_spot photo_spot_pk 
   CONSTRAINT     ^   ALTER TABLE ONLY photo_spot
    ADD CONSTRAINT photo_spot_pk PRIMARY KEY (spot_id, photo_id);
 B   ALTER TABLE ONLY public.photo_spot DROP CONSTRAINT photo_spot_pk;
       public         user    false    218    218            �
           2606    50185    photo_topo photo_topo_pk 
   CONSTRAINT     a   ALTER TABLE ONLY photo_topo
    ADD CONSTRAINT photo_topo_pk PRIMARY KEY (titre_topo, photo_id);
 B   ALTER TABLE ONLY public.photo_topo DROP CONSTRAINT photo_topo_pk;
       public         user    false    203    203            �
           2606    50216    profil profil_pk 
   CONSTRAINT     H   ALTER TABLE ONLY profil
    ADD CONSTRAINT profil_pk PRIMARY KEY (nom);
 :   ALTER TABLE ONLY public.profil DROP CONSTRAINT profil_pk;
       public         user    false    210            �
           2606    50262 $   spot_orientation spot_orientation_pk 
   CONSTRAINT     m   ALTER TABLE ONLY spot_orientation
    ADD CONSTRAINT spot_orientation_pk PRIMARY KEY (spot_id, orientation);
 N   ALTER TABLE ONLY public.spot_orientation DROP CONSTRAINT spot_orientation_pk;
       public         user    false    220    220            �
           2606    50247    spot spot_pk 
   CONSTRAINT     C   ALTER TABLE ONLY spot
    ADD CONSTRAINT spot_pk PRIMARY KEY (id);
 6   ALTER TABLE ONLY public.spot DROP CONSTRAINT spot_pk;
       public         user    false    217            �
           2606    50257    spot_profil spot_profil_pk 
   CONSTRAINT     ^   ALTER TABLE ONLY spot_profil
    ADD CONSTRAINT spot_profil_pk PRIMARY KEY (spot_id, profil);
 D   ALTER TABLE ONLY public.spot_profil DROP CONSTRAINT spot_profil_pk;
       public         user    false    219    219            �
           2606    50272    spot_topo spot_topo_pk 
   CONSTRAINT     Y   ALTER TABLE ONLY spot_topo
    ADD CONSTRAINT spot_topo_pk PRIMARY KEY (spot_id, titre);
 @   ALTER TABLE ONLY public.spot_topo DROP CONSTRAINT spot_topo_pk;
       public         user    false    222    222            �
           2606    50267    spot_type spot_type_pk 
   CONSTRAINT     X   ALTER TABLE ONLY spot_type
    ADD CONSTRAINT spot_type_pk PRIMARY KEY (type, spot_id);
 @   ALTER TABLE ONLY public.spot_type DROP CONSTRAINT spot_type_pk;
       public         user    false    221    221            �
           2606    50180    topo topo_pk 
   CONSTRAINT     F   ALTER TABLE ONLY topo
    ADD CONSTRAINT topo_pk PRIMARY KEY (titre);
 6   ALTER TABLE ONLY public.topo DROP CONSTRAINT topo_pk;
       public         user    false    202            �
           2606    50226    type type_pk 
   CONSTRAINT     D   ALTER TABLE ONLY type
    ADD CONSTRAINT type_pk PRIMARY KEY (nom);
 6   ALTER TABLE ONLY public.type DROP CONSTRAINT type_pk;
       public         user    false    212            �
           2606    50190    utilisateur utilisateur_pk 
   CONSTRAINT     U   ALTER TABLE ONLY utilisateur
    ADD CONSTRAINT utilisateur_pk PRIMARY KEY (pseudo);
 D   ALTER TABLE ONLY public.utilisateur DROP CONSTRAINT utilisateur_pk;
       public         user    false    204            �
           2606    50239    ville ville_pk 
   CONSTRAINT     E   ALTER TABLE ONLY ville
    ADD CONSTRAINT ville_pk PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.ville DROP CONSTRAINT ville_pk;
       public         user    false    215            �
           2606    50155    zone_texte zone_texte_pk 
   CONSTRAINT     O   ALTER TABLE ONLY zone_texte
    ADD CONSTRAINT zone_texte_pk PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.zone_texte DROP CONSTRAINT zone_texte_pk;
       public         user    false    199            �
           1259    50278    commentaire_idx    INDEX     z   CREATE INDEX commentaire_idx ON commentaire USING btree (date DESC);

ALTER TABLE commentaire CLUSTER ON commentaire_idx;
 #   DROP INDEX public.commentaire_idx;
       public         user    false    223            �
           1259    50167    paragraphe_idx    INDEX     �   CREATE UNIQUE INDEX paragraphe_idx ON paragraphe USING btree (zone_texte_id, num_ordre);

ALTER TABLE paragraphe CLUSTER ON paragraphe_idx;
 "   DROP INDEX public.paragraphe_idx;
       public         user    false    201    201                       2606    50384    ville departement_ville_fk    FK CONSTRAINT     y   ALTER TABLE ONLY ville
    ADD CONSTRAINT departement_ville_fk FOREIGN KEY (departement) REFERENCES departement(numero);
 D   ALTER TABLE ONLY public.ville DROP CONSTRAINT departement_ville_fk;
       public       user    false    215    2796    213            
           2606    50359    spot difficulte_spot_fk    FK CONSTRAINT     u   ALTER TABLE ONLY spot
    ADD CONSTRAINT difficulte_spot_fk FOREIGN KEY (difficulte_min) REFERENCES difficulte(nom);
 A   ALTER TABLE ONLY public.spot DROP CONSTRAINT difficulte_spot_fk;
       public       user    false    209    2788    217                       2606    50364    spot difficulte_spot_fk1    FK CONSTRAINT     v   ALTER TABLE ONLY spot
    ADD CONSTRAINT difficulte_spot_fk1 FOREIGN KEY (difficulte_max) REFERENCES difficulte(nom);
 B   ALTER TABLE ONLY public.spot DROP CONSTRAINT difficulte_spot_fk1;
       public       user    false    209    217    2788                       2606    50354 "   emprunt exemplaire_topo_emprunt_fk    FK CONSTRAINT     �   ALTER TABLE ONLY emprunt
    ADD CONSTRAINT exemplaire_topo_emprunt_fk FOREIGN KEY (exemplaire_topo_id) REFERENCES exemplaire_topo(id) ON DELETE CASCADE;
 L   ALTER TABLE ONLY public.emprunt DROP CONSTRAINT exemplaire_topo_emprunt_fk;
       public       user    false    208    206    2784                       2606    50374 0   spot_orientation orientation_spot_orientation_fk    FK CONSTRAINT     �   ALTER TABLE ONLY spot_orientation
    ADD CONSTRAINT orientation_spot_orientation_fk FOREIGN KEY (orientation) REFERENCES orientation(nom);
 Z   ALTER TABLE ONLY public.spot_orientation DROP CONSTRAINT orientation_spot_orientation_fk;
       public       user    false    220    211    2792                       2606    50284    photo_spot photo_photo_spot_fk    FK CONSTRAINT     �   ALTER TABLE ONLY photo_spot
    ADD CONSTRAINT photo_photo_spot_fk FOREIGN KEY (photo_id) REFERENCES photo(id) ON DELETE CASCADE;
 H   ALTER TABLE ONLY public.photo_spot DROP CONSTRAINT photo_photo_spot_fk;
       public       user    false    197    218    2771                        2606    50289    photo_topo photo_photo_topo_fk    FK CONSTRAINT     �   ALTER TABLE ONLY photo_topo
    ADD CONSTRAINT photo_photo_topo_fk FOREIGN KEY (photo_id) REFERENCES photo(id) ON DELETE CASCADE;
 H   ALTER TABLE ONLY public.photo_topo DROP CONSTRAINT photo_photo_topo_fk;
       public       user    false    2771    197    203                       2606    50369 !   spot_profil profil_spot_profil_fk    FK CONSTRAINT     s   ALTER TABLE ONLY spot_profil
    ADD CONSTRAINT profil_spot_profil_fk FOREIGN KEY (profil) REFERENCES profil(nom);
 K   ALTER TABLE ONLY public.spot_profil DROP CONSTRAINT profil_spot_profil_fk;
       public       user    false    219    210    2790                       2606    50394    commentaire spot_commentaire_fk    FK CONSTRAINT     o   ALTER TABLE ONLY commentaire
    ADD CONSTRAINT spot_commentaire_fk FOREIGN KEY (spot_id) REFERENCES spot(id);
 I   ALTER TABLE ONLY public.commentaire DROP CONSTRAINT spot_commentaire_fk;
       public       user    false    223    217    2800                       2606    50419    photo_spot spot_photo_spot_fk    FK CONSTRAINT        ALTER TABLE ONLY photo_spot
    ADD CONSTRAINT spot_photo_spot_fk FOREIGN KEY (spot_id) REFERENCES spot(id) ON DELETE CASCADE;
 G   ALTER TABLE ONLY public.photo_spot DROP CONSTRAINT spot_photo_spot_fk;
       public       user    false    217    218    2800                       2606    50409 )   spot_orientation spot_spot_orientation_fk    FK CONSTRAINT     �   ALTER TABLE ONLY spot_orientation
    ADD CONSTRAINT spot_spot_orientation_fk FOREIGN KEY (spot_id) REFERENCES spot(id) ON DELETE CASCADE;
 S   ALTER TABLE ONLY public.spot_orientation DROP CONSTRAINT spot_spot_orientation_fk;
       public       user    false    220    217    2800                       2606    50414    spot_profil spot_spot_profil_fk    FK CONSTRAINT     �   ALTER TABLE ONLY spot_profil
    ADD CONSTRAINT spot_spot_profil_fk FOREIGN KEY (spot_id) REFERENCES spot(id) ON DELETE CASCADE;
 I   ALTER TABLE ONLY public.spot_profil DROP CONSTRAINT spot_spot_profil_fk;
       public       user    false    219    217    2800                       2606    50399    spot_topo spot_spot_topo_fk    FK CONSTRAINT     }   ALTER TABLE ONLY spot_topo
    ADD CONSTRAINT spot_spot_topo_fk FOREIGN KEY (spot_id) REFERENCES spot(id) ON DELETE CASCADE;
 E   ALTER TABLE ONLY public.spot_topo DROP CONSTRAINT spot_spot_topo_fk;
       public       user    false    222    217    2800                       2606    50404    spot_type spot_type_spot_fk    FK CONSTRAINT     }   ALTER TABLE ONLY spot_type
    ADD CONSTRAINT spot_type_spot_fk FOREIGN KEY (spot_id) REFERENCES spot(id) ON DELETE CASCADE;
 E   ALTER TABLE ONLY public.spot_type DROP CONSTRAINT spot_type_spot_fk;
       public       user    false    221    217    2800                       2606    50324 '   exemplaire_topo topo_exemplaire_topo_fk    FK CONSTRAINT     �   ALTER TABLE ONLY exemplaire_topo
    ADD CONSTRAINT topo_exemplaire_topo_fk FOREIGN KEY (titre_topo) REFERENCES topo(titre) ON DELETE CASCADE;
 Q   ALTER TABLE ONLY public.exemplaire_topo DROP CONSTRAINT topo_exemplaire_topo_fk;
       public       user    false    2778    202    206                       2606    50329    photo_topo topo_photo_topo_fk    FK CONSTRAINT     �   ALTER TABLE ONLY photo_topo
    ADD CONSTRAINT topo_photo_topo_fk FOREIGN KEY (titre_topo) REFERENCES topo(titre) ON DELETE CASCADE;
 G   ALTER TABLE ONLY public.photo_topo DROP CONSTRAINT topo_photo_topo_fk;
       public       user    false    2778    202    203                       2606    50319    spot_topo topo_spot_topo_fk    FK CONSTRAINT     ~   ALTER TABLE ONLY spot_topo
    ADD CONSTRAINT topo_spot_topo_fk FOREIGN KEY (titre) REFERENCES topo(titre) ON DELETE CASCADE;
 E   ALTER TABLE ONLY public.spot_topo DROP CONSTRAINT topo_spot_topo_fk;
       public       user    false    202    2778    222                       2606    50379    spot_type type_type_spot_fk    FK CONSTRAINT     i   ALTER TABLE ONLY spot_type
    ADD CONSTRAINT type_type_spot_fk FOREIGN KEY (type) REFERENCES type(nom);
 E   ALTER TABLE ONLY public.spot_type DROP CONSTRAINT type_type_spot_fk;
       public       user    false    221    2794    212                       2606    50339 &   commentaire utilisateur_commentaire_fk    FK CONSTRAINT     �   ALTER TABLE ONLY commentaire
    ADD CONSTRAINT utilisateur_commentaire_fk FOREIGN KEY (pseudo_auteur) REFERENCES utilisateur(pseudo);
 P   ALTER TABLE ONLY public.commentaire DROP CONSTRAINT utilisateur_commentaire_fk;
       public       user    false    2782    223    204                       2606    50344    emprunt utilisateur_emprunt_fk    FK CONSTRAINT     �   ALTER TABLE ONLY emprunt
    ADD CONSTRAINT utilisateur_emprunt_fk FOREIGN KEY (pseudo_emprunteur) REFERENCES utilisateur(pseudo) ON DELETE CASCADE;
 H   ALTER TABLE ONLY public.emprunt DROP CONSTRAINT utilisateur_emprunt_fk;
       public       user    false    208    204    2782                       2606    50349 .   exemplaire_topo utilisateur_exemplaire_topo_fk    FK CONSTRAINT     �   ALTER TABLE ONLY exemplaire_topo
    ADD CONSTRAINT utilisateur_exemplaire_topo_fk FOREIGN KEY (pseudo_proprietaire) REFERENCES utilisateur(pseudo) ON DELETE CASCADE;
 X   ALTER TABLE ONLY public.exemplaire_topo DROP CONSTRAINT utilisateur_exemplaire_topo_fk;
       public       user    false    206    204    2782            	           2606    50334    spot utilisateur_spot_fk    FK CONSTRAINT     y   ALTER TABLE ONLY spot
    ADD CONSTRAINT utilisateur_spot_fk FOREIGN KEY (pseudo_auteur) REFERENCES utilisateur(pseudo);
 B   ALTER TABLE ONLY public.spot DROP CONSTRAINT utilisateur_spot_fk;
       public       user    false    2782    204    217                       2606    50389    spot ville_spot_fk    FK CONSTRAINT     d   ALTER TABLE ONLY spot
    ADD CONSTRAINT ville_spot_fk FOREIGN KEY (ville_id) REFERENCES ville(id);
 <   ALTER TABLE ONLY public.spot DROP CONSTRAINT ville_spot_fk;
       public       user    false    217    215    2798                       2606    50314 %   commentaire zone_texte_commentaire_fk    FK CONSTRAINT     �   ALTER TABLE ONLY commentaire
    ADD CONSTRAINT zone_texte_commentaire_fk FOREIGN KEY (id) REFERENCES zone_texte(id) ON DELETE CASCADE;
 O   ALTER TABLE ONLY public.commentaire DROP CONSTRAINT zone_texte_commentaire_fk;
       public       user    false    199    2773    223                       2606    50299 -   exemplaire_topo zone_texte_exemplaire_topo_fk    FK CONSTRAINT     �   ALTER TABLE ONLY exemplaire_topo
    ADD CONSTRAINT zone_texte_exemplaire_topo_fk FOREIGN KEY (condition_id) REFERENCES zone_texte(id);
 W   ALTER TABLE ONLY public.exemplaire_topo DROP CONSTRAINT zone_texte_exemplaire_topo_fk;
       public       user    false    2773    206    199            �
           2606    50294 #   paragraphe zone_texte_paragraphe_fk    FK CONSTRAINT     �   ALTER TABLE ONLY paragraphe
    ADD CONSTRAINT zone_texte_paragraphe_fk FOREIGN KEY (zone_texte_id) REFERENCES zone_texte(id) ON DELETE CASCADE;
 M   ALTER TABLE ONLY public.paragraphe DROP CONSTRAINT zone_texte_paragraphe_fk;
       public       user    false    2773    201    199                       2606    50309    spot zone_texte_spot_fk    FK CONSTRAINT     u   ALTER TABLE ONLY spot
    ADD CONSTRAINT zone_texte_spot_fk FOREIGN KEY (presentation_id) REFERENCES zone_texte(id);
 A   ALTER TABLE ONLY public.spot DROP CONSTRAINT zone_texte_spot_fk;
       public       user    false    199    217    2773            �
           2606    50304    topo zone_texte_topo_fk    FK CONSTRAINT     t   ALTER TABLE ONLY topo
    ADD CONSTRAINT zone_texte_topo_fk FOREIGN KEY (description_id) REFERENCES zone_texte(id);
 A   ALTER TABLE ONLY public.topo DROP CONSTRAINT zone_texte_topo_fk;
       public       user    false    202    2773    199            �   5   x�3�420��50�54Q04�2!=cc��̼t���ĜĔT�4NC�=... ��
�      �     x�MTKn�8]W�»�4���ұ{�ĝ nh`6Lĉ	(b)�>Q��t�y��7���b}^��J����z�9��N+����-Z��*���{kN�R\R\�����z�/@jZ�v|}:*AU}�����g��V�2�l!��������tm<N"�_<�wԔ���I��qZB��qZ��(��x�}�Q� :IZk��_�����;�ګ;�Y6YHv��/HNk���gAc[���t�U���;�g5}�RD��!�5�S���+��K�J�r�N�%�Lh�h���<��򂾎oV�n༤���Q��:���oC�zR>Rt�|���bI�A)���(2��\�l�����=�r�.*hu!�G� �+�.څJ?�*�@��e
�¿�欳�?��ಠ��v8� ;��(�QV�3�Qe�eM����a�N![C�00��t�q�J�.�2��.iU�%��ӽ?`GYt��[?������˪:pU��~g�
�~�t�DG\�Jē��м��rn/';�I�$�� �Ρ���V\�Mv��,Z�+ګ��e��zF���ZЏ��t��uC��K��2�bI{�c"���f�E���ENiY���%T߂ t���"?lA�C��~�P͒�+�J�a ת��؁���87�L;�&�[��F�nqj���bSN�U|�
�ݩ���}���\XD��[/[��3�Y���6�|ַ�,CT�~+��5ަlc[̀��?��Qͥ�      �   8   x��� !�����.4����%�Ya�mv(Q�B�6�8�c&\q��~�C�      �   /   x�3���)I��/�4�420��50�5@bsaSagp��qqq eQK      �   7   x�3�t/��-H-RH,-�/-RHIU�/������Kw-NN�ILI�4����� ���      �      x����s�r�
"��p�p.�p�=... AE�      �     x�=��N1Dk�WL�	���#*RS�8�&���-{}���Q��16w�-���w�Gn��1l[<r=�A�\"%��rKx���I[R�zl�j�:��e�<b���@�ݨ{�͞t1�D�+��\���$C�!1e�����oŷk6j�j��4C��_D���-L['�gȕZ˓z%����I"	��,͈)���X�QQ<�ɨ���j�0��mIu��c�s��2�-k�/���az)<k�t��N"p�
[�y����$��i�?L��R      �   y   x�=�A
�0D��O�H~��@pՅKA�JiiM�������f�a����{R[>CN깫9�o8V�|��B�c$�^��Kڂ�u`#�Q���� +�|��Q���z�Nfl�V[�e��RY"�`�./      �   :   x����0İ����)�J/鿎 fQ9t^f.+6;'���Mሢq`ecǅ'n��U�	�      �   (   x�s/��-H-RH,-�/-RHIU�/����4����� ��
      �   -   x�s9��,���+,��$391��%1''�+��� '?7�+F��� ��      �   B  x����n�0Eף��N��_zl�:� -�,��e6��))���j����e�2K6�aA�g��P�U�4��]����3<V��ҕ�Vk-<߃����<&L�1��'�Ƅfx\�>�lZ��L�n	M�1�v�&�+�U��F���5�t�L����l$q<ʞ��#��Ywο��b��Ǭ"ӭ��ҵ�:{�O	�=��I.A��#���n��ӎ.!&�LB�����{W-F3���sV?-��y�L��&�#
�U��W�Z]�!��J�< ����Gvhآj�m�\�D1rdL�`"����$?�Y��iJ�\e�9 ��fŮ#R��\A^F����ֻ���nk��ݬ�d����A�y>�2B�7k)��h���F�y�hI2��'{��Q
8��{�s����L�h���%�*�4YToj�g
B�!���<9�XP@lE�#��3nuc���u;qU1*�W��8�s-gx�V��T��zQn���A�������bꨱ�ۀJx0�&�N�!�_I�r��t/�]�CI�	��h�\*�F����>T�z����[ȅc�����C&�_�(�����      �   ~   x�-�;!�zu�L�'pKCA��?G$A�74���c$I��P�Ae�
���J���p�I��F3�fL�<<z"����&%	�II�ru�+�������^��B���4.�=]�v��$�ޤL� ��.�      �   �   x�U�;�0��0(����HT4�@2�ϝr.{ߦ��L�t�{y�r7���<Χ9�Ӝs2V�%�w�r����8�=W�A�@8T�������N�NQ�H��FұR��־�`
ݢ� k@�@�V�ʀ�U-T0�z���\�A ��c��H      �   \   x�}й�0���� ��
h�!	��C�
v��՚��M9���ÑB�r�c-��S�i�4r�8͜Nh�A���(�8�H�X�j3�Ӣ      �   G   x�E�!�  @MC��� �� $s�2CZw��x��f ��)%)K�tKE��#�0����=�z���4�      �   (   x�s/��-H-RH,-�/-RHIU�/����4����� ��
      �      x�sK�I�,N�r��O����� 8&�      �     x�m��n�0 @��+v7AV��D�X��e�R�`-����}�~l���.���Ŕ���p�sp�(_�EnJ-:�6y	�ܗ�uv]Ux�M�}B��%A���!��%���Ԗ�@��jaԼ\�mw��q+�֒�F I�\�B�n:���=�C�1�>�t_�ʉ��I��c�L� �.���X���)��"s7��8̌#�mX ]I$������]ܷmG��'�+|��Ig����e�yy���P?��e�r��y6/�h��b	�M��ء6b������`�!�*���(߬�wt      �   �   x�3�0600 ��!��9�y\F@��1X�pgYj^~1�1�ch�I�K�I-)I�M)2��L@��`I���L�!��\�@�	�X���+��Bf@�D�'U7(�,��D�V75����a�O��sbqIj��=... ��+P      �   Y   x�3�.-H-R.�/Q((�O�HUHIU�/����2�tV?��$1�D���˘ӱ�$��I�	�s~^JfIf~H����+�=... �~m     