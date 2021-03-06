PGDMP     $                    x            db_mis_iniciales    9.2.10    9.2.10     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            �           1262    49152    db_mis_iniciales    DATABASE     �   CREATE DATABASE db_mis_iniciales WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Spanish_Spain.1252' LC_CTYPE = 'Spanish_Spain.1252';
     DROP DATABASE db_mis_iniciales;
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    6            �           0    0    public    ACL     |   REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
                  postgres    false    6            �            3079    11727    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            �           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    173            �            1259    49157    tb_clientes    TABLE       CREATE TABLE tb_clientes (
    cli_id integer NOT NULL,
    cli_documento character varying(12),
    cli_nombre character varying(30) NOT NULL,
    cli_apellido character varying(30) NOT NULL,
    cli_direccion character varying(40) NOT NULL,
    cli_telefono character varying(20),
    cli_celular character varying(20),
    cli_fax character varying(20),
    cli_sexo character(1) NOT NULL,
    cli_cumple date,
    CONSTRAINT tb_clientes_cli_sexo_check CHECK ((cli_sexo = ANY (ARRAY['M'::bpchar, 'F'::bpchar])))
);
    DROP TABLE public.tb_clientes;
       public         postgres    false    6            �           0    0    tb_clientes    ACL     �   REVOKE ALL ON TABLE tb_clientes FROM PUBLIC;
REVOKE ALL ON TABLE tb_clientes FROM postgres;
GRANT ALL ON TABLE tb_clientes TO postgres;
GRANT SELECT ON TABLE tb_clientes TO gp_mis_iniciales;
            public       postgres    false    169            �            1259    49155    tb_clientes_cli_id_seq    SEQUENCE     x   CREATE SEQUENCE tb_clientes_cli_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.tb_clientes_cli_id_seq;
       public       postgres    false    6    169            �           0    0    tb_clientes_cli_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE tb_clientes_cli_id_seq OWNED BY tb_clientes.cli_id;
            public       postgres    false    168            �            1259    49168    tb_facturaciones    TABLE     �   CREATE TABLE tb_facturaciones (
    fac_id integer NOT NULL,
    fac_numero numeric(8,0),
    fac_fecha date,
    fac_cliente integer,
    fac_total numeric(12,2),
    CONSTRAINT tb_facturaciones_fac_total_check CHECK ((fac_total > (1000)::numeric))
);
 $   DROP TABLE public.tb_facturaciones;
       public         postgres    false    6            �            1259    49166    tb_facturaciones_fac_id_seq    SEQUENCE     }   CREATE SEQUENCE tb_facturaciones_fac_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.tb_facturaciones_fac_id_seq;
       public       postgres    false    171    6            �           0    0    tb_facturaciones_fac_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE tb_facturaciones_fac_id_seq OWNED BY tb_facturaciones.fac_id;
            public       postgres    false    170            �            1259    49182    vw_clientes_00    VIEW     �   CREATE VIEW vw_clientes_00 AS
    SELECT tb_clientes.cli_documento, tb_clientes.cli_nombre, tb_clientes.cli_apellido, tb_clientes.cli_telefono FROM tb_clientes ORDER BY tb_clientes.cli_nombre;
 !   DROP VIEW public.vw_clientes_00;
       public       postgres    false    169    169    169    169    6                       2604    49160    cli_id    DEFAULT     j   ALTER TABLE ONLY tb_clientes ALTER COLUMN cli_id SET DEFAULT nextval('tb_clientes_cli_id_seq'::regclass);
 A   ALTER TABLE public.tb_clientes ALTER COLUMN cli_id DROP DEFAULT;
       public       postgres    false    169    168    169                        2604    49171    fac_id    DEFAULT     t   ALTER TABLE ONLY tb_facturaciones ALTER COLUMN fac_id SET DEFAULT nextval('tb_facturaciones_fac_id_seq'::regclass);
 F   ALTER TABLE public.tb_facturaciones ALTER COLUMN fac_id DROP DEFAULT;
       public       postgres    false    171    170    171            �          0    49157    tb_clientes 
   TABLE DATA               �   COPY tb_clientes (cli_id, cli_documento, cli_nombre, cli_apellido, cli_direccion, cli_telefono, cli_celular, cli_fax, cli_sexo, cli_cumple) FROM stdin;
    public       postgres    false    169   #       �           0    0    tb_clientes_cli_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('tb_clientes_cli_id_seq', 1, false);
            public       postgres    false    168            �          0    49168    tb_facturaciones 
   TABLE DATA               Z   COPY tb_facturaciones (fac_id, fac_numero, fac_fecha, fac_cliente, fac_total) FROM stdin;
    public       postgres    false    171   �#       �           0    0    tb_facturaciones_fac_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('tb_facturaciones_fac_id_seq', 1, false);
            public       postgres    false    170            #           2606    49165    tb_clientes_cli_documento_key 
   CONSTRAINT     f   ALTER TABLE ONLY tb_clientes
    ADD CONSTRAINT tb_clientes_cli_documento_key UNIQUE (cli_documento);
 S   ALTER TABLE ONLY public.tb_clientes DROP CONSTRAINT tb_clientes_cli_documento_key;
       public         postgres    false    169    169            %           2606    49163    tb_clientes_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY tb_clientes
    ADD CONSTRAINT tb_clientes_pkey PRIMARY KEY (cli_id);
 F   ALTER TABLE ONLY public.tb_clientes DROP CONSTRAINT tb_clientes_pkey;
       public         postgres    false    169    169            '           2606    49176    tb_facturaciones_fac_numero_key 
   CONSTRAINT     j   ALTER TABLE ONLY tb_facturaciones
    ADD CONSTRAINT tb_facturaciones_fac_numero_key UNIQUE (fac_numero);
 Z   ALTER TABLE ONLY public.tb_facturaciones DROP CONSTRAINT tb_facturaciones_fac_numero_key;
       public         postgres    false    171    171            )           2606    49174    tb_facturaciones_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY tb_facturaciones
    ADD CONSTRAINT tb_facturaciones_pkey PRIMARY KEY (fac_id);
 P   ALTER TABLE ONLY public.tb_facturaciones DROP CONSTRAINT tb_facturaciones_pkey;
       public         postgres    false    171    171            *           2606    49177 !   tb_facturaciones_fac_cliente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY tb_facturaciones
    ADD CONSTRAINT tb_facturaciones_fac_cliente_fkey FOREIGN KEY (fac_cliente) REFERENCES tb_clientes(cli_id) ON UPDATE CASCADE ON DELETE RESTRICT;
 \   ALTER TABLE ONLY public.tb_facturaciones DROP CONSTRAINT tb_facturaciones_fac_cliente_fkey;
       public       postgres    false    1829    169    171            �           826    49187     DEFAULT PRIVILEGES FOR SEQUENCES    DEFAULT ACL     L  ALTER DEFAULT PRIVILEGES FOR ROLE postgres REVOKE ALL ON SEQUENCES  FROM PUBLIC;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres REVOKE ALL ON SEQUENCES  FROM postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON SEQUENCES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON SEQUENCES  TO gp_mis_iniciales;
                  postgres    false            �           826    49186    DEFAULT PRIVILEGES FOR TABLES    DEFAULT ACL     Q  ALTER DEFAULT PRIVILEGES FOR ROLE postgres REVOKE ALL ON TABLES  FROM PUBLIC;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres REVOKE ALL ON TABLES  FROM postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON TABLES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT SELECT,INSERT,DELETE ON TABLES  TO gp_mis_iniciales;
                  postgres    false            �   �   x�E��
�@�u�+��$�yuY� 
���b�N�A�ޱ*�@{Jc��k.}KNc�o}/�zjc'����#e�P*����N)�y`T�R��+4Hoi����;���JҲ>sϏ��~�G�_��Ac�"+Jp��P��K�aѤ86O8ƶeY�&�������Uo�=gj��8B���9�      �   M   x�M��� ��l.P�?5�C����jTy6e�
O�:)ZʿҖz�m=�Ƶ4J}�6���,���#?���<��|     