PGDMP                         y            polus    13.4 (Debian 13.4-1.pgdg100+1)    13.4 (Debian 13.4-1.pgdg100+1) �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16385    polus    DATABASE     Z   CREATE DATABASE polus WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'es_SV.UTF-8';
    DROP DATABASE polus;
                postgres    false            �            1255    16386    sp_historialinventario()    FUNCTION     �   CREATE FUNCTION public.sp_historialinventario() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
INSERT INTO historialInventario(idInventario, cantidad, fecha) VALUES(old.idInventario, old.cantidad, current_date);
RETURN NEW;
END
$$;
 /   DROP FUNCTION public.sp_historialinventario();
       public          postgres    false            �            1255    16387    sp_historialprecio()    FUNCTION     �   CREATE FUNCTION public.sp_historialprecio() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
INSERT INTO historialPrecio(idProducto, precio, fecha) VALUES(old.idProducto, old.precio, current_date);
RETURN NEW;
END
$$;
 +   DROP FUNCTION public.sp_historialprecio();
       public          postgres    false            �            1259    16388    admon    TABLE     �  CREATE TABLE public.admon (
    idadmon integer NOT NULL,
    nombre character varying(25) NOT NULL,
    apellido character varying(25) NOT NULL,
    genero character varying(10) NOT NULL,
    correo character varying(80) NOT NULL,
    foto character varying(50) NOT NULL,
    fechanacimiento date NOT NULL,
    telefono character(9) NOT NULL,
    direccion character varying(200) NOT NULL,
    usuario character varying(25) NOT NULL,
    "contraseña" character varying(60) NOT NULL,
    idestadousuario integer,
    idtipousuario integer,
    dobleautenticacion character(2) NOT NULL,
    intentos integer NOT NULL,
    tokenclave character varying(60),
    claverequest integer NOT NULL
);
    DROP TABLE public.admon;
       public         heap    postgres    false            �            1259    16391    admon_idadmon_seq    SEQUENCE     �   CREATE SEQUENCE public.admon_idadmon_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.admon_idadmon_seq;
       public          postgres    false    200            �           0    0    admon_idadmon_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.admon_idadmon_seq OWNED BY public.admon.idadmon;
          public          postgres    false    201            �            1259    16393    bitacoracliente    TABLE     �   CREATE TABLE public.bitacoracliente (
    idbitacora integer NOT NULL,
    idcliente integer,
    fecha date NOT NULL,
    hora time without time zone NOT NULL,
    accion character varying(20) NOT NULL,
    descripcion character varying(200) NOT NULL
);
 #   DROP TABLE public.bitacoracliente;
       public         heap    postgres    false            �            1259    16396    bitacoracliente_idbitacora_seq    SEQUENCE     �   CREATE SEQUENCE public.bitacoracliente_idbitacora_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.bitacoracliente_idbitacora_seq;
       public          postgres    false    202            �           0    0    bitacoracliente_idbitacora_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.bitacoracliente_idbitacora_seq OWNED BY public.bitacoracliente.idbitacora;
          public          postgres    false    203            �            1259    16398    bitacorausuario    TABLE     �   CREATE TABLE public.bitacorausuario (
    idbitacora integer NOT NULL,
    idadmon integer,
    fecha date NOT NULL,
    hora time without time zone NOT NULL,
    accion character varying(20) NOT NULL,
    descripcion character varying(200) NOT NULL
);
 #   DROP TABLE public.bitacorausuario;
       public         heap    postgres    false            �            1259    16401    bitacorausuario_idbitacora_seq    SEQUENCE     �   CREATE SEQUENCE public.bitacorausuario_idbitacora_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.bitacorausuario_idbitacora_seq;
       public          postgres    false    204            �           0    0    bitacorausuario_idbitacora_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.bitacorausuario_idbitacora_seq OWNED BY public.bitacorausuario.idbitacora;
          public          postgres    false    205            �            1259    16403 	   categoria    TABLE     �   CREATE TABLE public.categoria (
    idcategoria integer NOT NULL,
    categoria character varying(30) NOT NULL,
    imagen character varying(50)
);
    DROP TABLE public.categoria;
       public         heap    postgres    false            �            1259    16406    categoria_idcategoria_seq    SEQUENCE     �   CREATE SEQUENCE public.categoria_idcategoria_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.categoria_idcategoria_seq;
       public          postgres    false    206            �           0    0    categoria_idcategoria_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.categoria_idcategoria_seq OWNED BY public.categoria.idcategoria;
          public          postgres    false    207            �            1259    16408    cliente    TABLE     �  CREATE TABLE public.cliente (
    idcliente integer NOT NULL,
    nombre character varying(25) NOT NULL,
    apellido character varying(25) NOT NULL,
    genero character varying(10) NOT NULL,
    correo character varying(80) NOT NULL,
    foto character varying(50) NOT NULL,
    fechanacimiento date NOT NULL,
    telefono character(9) NOT NULL,
    direccion character varying(200) NOT NULL,
    usuario character varying(25) NOT NULL,
    "contraseña" character varying(60) NOT NULL,
    idestadousuario integer,
    fecharegistro date,
    intentos integer NOT NULL,
    tokenclave character varying(60),
    claverequest integer NOT NULL,
    dobleautenticacion character(2) NOT NULL
);
    DROP TABLE public.cliente;
       public         heap    postgres    false            �            1259    16411    cliente_idcliente_seq    SEQUENCE     �   CREATE SEQUENCE public.cliente_idcliente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.cliente_idcliente_seq;
       public          postgres    false    208            �           0    0    cliente_idcliente_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.cliente_idcliente_seq OWNED BY public.cliente.idcliente;
          public          postgres    false    209            �            1259    16413    detallepedido    TABLE     �   CREATE TABLE public.detallepedido (
    iddetallepedido integer NOT NULL,
    cantidad integer NOT NULL,
    precioproducto numeric NOT NULL,
    idpedido integer,
    idproducto integer
);
 !   DROP TABLE public.detallepedido;
       public         heap    postgres    false            �            1259    16419 !   detallepedido_iddetallepedido_seq    SEQUENCE     �   CREATE SEQUENCE public.detallepedido_iddetallepedido_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.detallepedido_iddetallepedido_seq;
       public          postgres    false    210            �           0    0 !   detallepedido_iddetallepedido_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.detallepedido_iddetallepedido_seq OWNED BY public.detallepedido.iddetallepedido;
          public          postgres    false    211            �            1259    16421    estadomarca    TABLE     x   CREATE TABLE public.estadomarca (
    idestadomarca integer NOT NULL,
    estadomarca character varying(20) NOT NULL
);
    DROP TABLE public.estadomarca;
       public         heap    postgres    false            �            1259    16424    estadomarca_idestadomarca_seq    SEQUENCE     �   CREATE SEQUENCE public.estadomarca_idestadomarca_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.estadomarca_idestadomarca_seq;
       public          postgres    false    212            �           0    0    estadomarca_idestadomarca_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.estadomarca_idestadomarca_seq OWNED BY public.estadomarca.idestadomarca;
          public          postgres    false    213            �            1259    16426    estadopedido    TABLE     {   CREATE TABLE public.estadopedido (
    idestadopedido integer NOT NULL,
    estadopedido character varying(20) NOT NULL
);
     DROP TABLE public.estadopedido;
       public         heap    postgres    false            �            1259    16429    estadopedido_idestadopedido_seq    SEQUENCE     �   CREATE SEQUENCE public.estadopedido_idestadopedido_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.estadopedido_idestadopedido_seq;
       public          postgres    false    214            �           0    0    estadopedido_idestadopedido_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.estadopedido_idestadopedido_seq OWNED BY public.estadopedido.idestadopedido;
          public          postgres    false    215            �            1259    16431    estadoresena    TABLE     {   CREATE TABLE public.estadoresena (
    idestadoresena integer NOT NULL,
    estadoresena character varying(20) NOT NULL
);
     DROP TABLE public.estadoresena;
       public         heap    postgres    false            �            1259    16434    estadoresena_idestadoresena_seq    SEQUENCE     �   CREATE SEQUENCE public.estadoresena_idestadoresena_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.estadoresena_idestadoresena_seq;
       public          postgres    false    216            �           0    0    estadoresena_idestadoresena_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.estadoresena_idestadoresena_seq OWNED BY public.estadoresena.idestadoresena;
          public          postgres    false    217            �            1259    16436    estadousuario    TABLE     ~   CREATE TABLE public.estadousuario (
    idestadousuario integer NOT NULL,
    estadousuario character varying(10) NOT NULL
);
 !   DROP TABLE public.estadousuario;
       public         heap    postgres    false            �            1259    16439 !   estadousuario_idestadousuario_seq    SEQUENCE     �   CREATE SEQUENCE public.estadousuario_idestadousuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.estadousuario_idestadousuario_seq;
       public          postgres    false    218            �           0    0 !   estadousuario_idestadousuario_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.estadousuario_idestadousuario_seq OWNED BY public.estadousuario.idestadousuario;
          public          postgres    false    219            �            1259    16441    historialinventario    TABLE     �   CREATE TABLE public.historialinventario (
    idhistorialinventario integer NOT NULL,
    idinventario integer NOT NULL,
    cantidad numeric NOT NULL,
    fecha date NOT NULL
);
 '   DROP TABLE public.historialinventario;
       public         heap    postgres    false            �            1259    16447 -   historialinventario_idhistorialinventario_seq    SEQUENCE     �   CREATE SEQUENCE public.historialinventario_idhistorialinventario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 D   DROP SEQUENCE public.historialinventario_idhistorialinventario_seq;
       public          postgres    false    220            �           0    0 -   historialinventario_idhistorialinventario_seq    SEQUENCE OWNED BY        ALTER SEQUENCE public.historialinventario_idhistorialinventario_seq OWNED BY public.historialinventario.idhistorialinventario;
          public          postgres    false    221            �            1259    16449    historialprecio    TABLE     �   CREATE TABLE public.historialprecio (
    idhistorialprecio integer NOT NULL,
    idproducto integer NOT NULL,
    precio numeric NOT NULL,
    fecha date NOT NULL
);
 #   DROP TABLE public.historialprecio;
       public         heap    postgres    false            �            1259    16455 %   historialprecio_idhistorialprecio_seq    SEQUENCE     �   CREATE SEQUENCE public.historialprecio_idhistorialprecio_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.historialprecio_idhistorialprecio_seq;
       public          postgres    false    222            �           0    0 %   historialprecio_idhistorialprecio_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.historialprecio_idhistorialprecio_seq OWNED BY public.historialprecio.idhistorialprecio;
          public          postgres    false    223            �            1259    16457    historialsesionadmon    TABLE     �   CREATE TABLE public.historialsesionadmon (
    idhistorialsesion_a integer NOT NULL,
    idadmon integer NOT NULL,
    phpinfo character varying(500) NOT NULL,
    fechasesion date NOT NULL
);
 (   DROP TABLE public.historialsesionadmon;
       public         heap    postgres    false            �            1259    16463 ,   historialsesionadmon_idhistorialsesion_a_seq    SEQUENCE     �   CREATE SEQUENCE public.historialsesionadmon_idhistorialsesion_a_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 C   DROP SEQUENCE public.historialsesionadmon_idhistorialsesion_a_seq;
       public          postgres    false    224            �           0    0 ,   historialsesionadmon_idhistorialsesion_a_seq    SEQUENCE OWNED BY     }   ALTER SEQUENCE public.historialsesionadmon_idhistorialsesion_a_seq OWNED BY public.historialsesionadmon.idhistorialsesion_a;
          public          postgres    false    225            �            1259    16465    historialsesioncliente    TABLE     �   CREATE TABLE public.historialsesioncliente (
    idhistorialsesion_c integer NOT NULL,
    idcliente integer NOT NULL,
    phpinfo character varying(500) NOT NULL,
    fechasesion date NOT NULL
);
 *   DROP TABLE public.historialsesioncliente;
       public         heap    postgres    false            �            1259    16471 .   historialsesioncliente_idhistorialsesion_c_seq    SEQUENCE     �   CREATE SEQUENCE public.historialsesioncliente_idhistorialsesion_c_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 E   DROP SEQUENCE public.historialsesioncliente_idhistorialsesion_c_seq;
       public          postgres    false    226            �           0    0 .   historialsesioncliente_idhistorialsesion_c_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.historialsesioncliente_idhistorialsesion_c_seq OWNED BY public.historialsesioncliente.idhistorialsesion_c;
          public          postgres    false    227            �            1259    16473    imagenproducto    TABLE     �   CREATE TABLE public.imagenproducto (
    idimagenproducto integer NOT NULL,
    imagen character varying(50) NOT NULL,
    idproducto integer
);
 "   DROP TABLE public.imagenproducto;
       public         heap    postgres    false            �            1259    16476 #   imagenproducto_idimagenproducto_seq    SEQUENCE     �   CREATE SEQUENCE public.imagenproducto_idimagenproducto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.imagenproducto_idimagenproducto_seq;
       public          postgres    false    228            �           0    0 #   imagenproducto_idimagenproducto_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.imagenproducto_idimagenproducto_seq OWNED BY public.imagenproducto.idimagenproducto;
          public          postgres    false    229            �            1259    16478 
   inventario    TABLE     �   CREATE TABLE public.inventario (
    idinventario integer NOT NULL,
    cantidad integer NOT NULL,
    idproducto integer,
    idtalla integer
);
    DROP TABLE public.inventario;
       public         heap    postgres    false            �            1259    16481    inventario_idinventario_seq    SEQUENCE     �   CREATE SEQUENCE public.inventario_idinventario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.inventario_idinventario_seq;
       public          postgres    false    230            �           0    0    inventario_idinventario_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.inventario_idinventario_seq OWNED BY public.inventario.idinventario;
          public          postgres    false    231            �            1259    16483    marca    TABLE     �   CREATE TABLE public.marca (
    idmarca integer NOT NULL,
    marca character varying(25) NOT NULL,
    idestadomarca integer
);
    DROP TABLE public.marca;
       public         heap    postgres    false            �            1259    16486    marca_idmarca_seq    SEQUENCE     �   CREATE SEQUENCE public.marca_idmarca_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.marca_idmarca_seq;
       public          postgres    false    232            �           0    0    marca_idmarca_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.marca_idmarca_seq OWNED BY public.marca.idmarca;
          public          postgres    false    233            �            1259    16488    pedido    TABLE     �   CREATE TABLE public.pedido (
    idpedido integer NOT NULL,
    fechapedido date NOT NULL,
    idestadopedido integer,
    idcliente integer
);
    DROP TABLE public.pedido;
       public         heap    postgres    false            �            1259    16491    pedido_idpedido_seq    SEQUENCE     �   CREATE SEQUENCE public.pedido_idpedido_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.pedido_idpedido_seq;
       public          postgres    false    234            �           0    0    pedido_idpedido_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.pedido_idpedido_seq OWNED BY public.pedido.idpedido;
          public          postgres    false    235            �            1259    16493    precioantiguo    TABLE     �   CREATE TABLE public.precioantiguo (
    idprecioantiguo integer NOT NULL,
    idproducto integer,
    precio numeric NOT NULL,
    fecha_hora timestamp without time zone NOT NULL
);
 !   DROP TABLE public.precioantiguo;
       public         heap    postgres    false            �            1259    16499 !   precioantiguo_idprecioantiguo_seq    SEQUENCE     �   CREATE SEQUENCE public.precioantiguo_idprecioantiguo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.precioantiguo_idprecioantiguo_seq;
       public          postgres    false    236            �           0    0 !   precioantiguo_idprecioantiguo_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.precioantiguo_idprecioantiguo_seq OWNED BY public.precioantiguo.idprecioantiguo;
          public          postgres    false    237            �            1259    16501    producto    TABLE        CREATE TABLE public.producto (
    idproducto integer NOT NULL,
    nombre character varying(30) NOT NULL,
    descripcion character varying(120) NOT NULL,
    precio numeric NOT NULL,
    imagenprincipal character varying(50) NOT NULL,
    idsubcategoria integer,
    idmarca integer
);
    DROP TABLE public.producto;
       public         heap    postgres    false            �            1259    16507    producto_idproducto_seq    SEQUENCE     �   CREATE SEQUENCE public.producto_idproducto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.producto_idproducto_seq;
       public          postgres    false    238            �           0    0    producto_idproducto_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.producto_idproducto_seq OWNED BY public.producto.idproducto;
          public          postgres    false    239            �            1259    16509 
   puntuacion    TABLE     u   CREATE TABLE public.puntuacion (
    idpuntuacion integer NOT NULL,
    puntuacion character varying(15) NOT NULL
);
    DROP TABLE public.puntuacion;
       public         heap    postgres    false            �            1259    16512    puntuacion_idpuntuacion_seq    SEQUENCE     �   CREATE SEQUENCE public.puntuacion_idpuntuacion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.puntuacion_idpuntuacion_seq;
       public          postgres    false    240            �           0    0    puntuacion_idpuntuacion_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.puntuacion_idpuntuacion_seq OWNED BY public.puntuacion.idpuntuacion;
          public          postgres    false    241            �            1259    16514    resena    TABLE     2  CREATE TABLE public.resena (
    idresena integer NOT NULL,
    comentario character varying(80) NOT NULL,
    idpuntuacion integer,
    respuesta character varying(200),
    idproducto integer,
    idcliente integer,
    fecha date,
    hora time without time zone,
    idestadoresena integer NOT NULL
);
    DROP TABLE public.resena;
       public         heap    postgres    false            �            1259    16517    resena_idresena_seq    SEQUENCE     �   CREATE SEQUENCE public.resena_idresena_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.resena_idresena_seq;
       public          postgres    false    242            �           0    0    resena_idresena_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.resena_idresena_seq OWNED BY public.resena.idresena;
          public          postgres    false    243            �            1259    16519    subcategoria    TABLE     �   CREATE TABLE public.subcategoria (
    idsubcategoria integer NOT NULL,
    subcategoria character varying(30) NOT NULL,
    genero character varying(10) NOT NULL,
    idcategoria integer
);
     DROP TABLE public.subcategoria;
       public         heap    postgres    false            �            1259    16522    subcategoria_idsubcategoria_seq    SEQUENCE     �   CREATE SEQUENCE public.subcategoria_idsubcategoria_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.subcategoria_idsubcategoria_seq;
       public          postgres    false    244            �           0    0    subcategoria_idsubcategoria_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.subcategoria_idsubcategoria_seq OWNED BY public.subcategoria.idsubcategoria;
          public          postgres    false    245            �            1259    16524    talla    TABLE     �   CREATE TABLE public.talla (
    idtalla integer NOT NULL,
    talla character varying(15) NOT NULL,
    genero character varying(10) NOT NULL
);
    DROP TABLE public.talla;
       public         heap    postgres    false            �            1259    16527    talla_idtalla_seq    SEQUENCE     �   CREATE SEQUENCE public.talla_idtalla_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.talla_idtalla_seq;
       public          postgres    false    246            �           0    0    talla_idtalla_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.talla_idtalla_seq OWNED BY public.talla.idtalla;
          public          postgres    false    247            �            1259    16529    tipousuario    TABLE     x   CREATE TABLE public.tipousuario (
    idtipousuario integer NOT NULL,
    tipousuario character varying(20) NOT NULL
);
    DROP TABLE public.tipousuario;
       public         heap    postgres    false            �            1259    16532    tipousuario_idtipousuario_seq    SEQUENCE     �   CREATE SEQUENCE public.tipousuario_idtipousuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.tipousuario_idtipousuario_seq;
       public          postgres    false    248            �           0    0    tipousuario_idtipousuario_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.tipousuario_idtipousuario_seq OWNED BY public.tipousuario.idtipousuario;
          public          postgres    false    249            �           2604    16534    admon idadmon    DEFAULT     n   ALTER TABLE ONLY public.admon ALTER COLUMN idadmon SET DEFAULT nextval('public.admon_idadmon_seq'::regclass);
 <   ALTER TABLE public.admon ALTER COLUMN idadmon DROP DEFAULT;
       public          postgres    false    201    200            �           2604    16535    bitacoracliente idbitacora    DEFAULT     �   ALTER TABLE ONLY public.bitacoracliente ALTER COLUMN idbitacora SET DEFAULT nextval('public.bitacoracliente_idbitacora_seq'::regclass);
 I   ALTER TABLE public.bitacoracliente ALTER COLUMN idbitacora DROP DEFAULT;
       public          postgres    false    203    202            �           2604    16536    bitacorausuario idbitacora    DEFAULT     �   ALTER TABLE ONLY public.bitacorausuario ALTER COLUMN idbitacora SET DEFAULT nextval('public.bitacorausuario_idbitacora_seq'::regclass);
 I   ALTER TABLE public.bitacorausuario ALTER COLUMN idbitacora DROP DEFAULT;
       public          postgres    false    205    204            �           2604    16537    categoria idcategoria    DEFAULT     ~   ALTER TABLE ONLY public.categoria ALTER COLUMN idcategoria SET DEFAULT nextval('public.categoria_idcategoria_seq'::regclass);
 D   ALTER TABLE public.categoria ALTER COLUMN idcategoria DROP DEFAULT;
       public          postgres    false    207    206            �           2604    16538    cliente idcliente    DEFAULT     v   ALTER TABLE ONLY public.cliente ALTER COLUMN idcliente SET DEFAULT nextval('public.cliente_idcliente_seq'::regclass);
 @   ALTER TABLE public.cliente ALTER COLUMN idcliente DROP DEFAULT;
       public          postgres    false    209    208            �           2604    16539    detallepedido iddetallepedido    DEFAULT     �   ALTER TABLE ONLY public.detallepedido ALTER COLUMN iddetallepedido SET DEFAULT nextval('public.detallepedido_iddetallepedido_seq'::regclass);
 L   ALTER TABLE public.detallepedido ALTER COLUMN iddetallepedido DROP DEFAULT;
       public          postgres    false    211    210            �           2604    16540    estadomarca idestadomarca    DEFAULT     �   ALTER TABLE ONLY public.estadomarca ALTER COLUMN idestadomarca SET DEFAULT nextval('public.estadomarca_idestadomarca_seq'::regclass);
 H   ALTER TABLE public.estadomarca ALTER COLUMN idestadomarca DROP DEFAULT;
       public          postgres    false    213    212            �           2604    16541    estadopedido idestadopedido    DEFAULT     �   ALTER TABLE ONLY public.estadopedido ALTER COLUMN idestadopedido SET DEFAULT nextval('public.estadopedido_idestadopedido_seq'::regclass);
 J   ALTER TABLE public.estadopedido ALTER COLUMN idestadopedido DROP DEFAULT;
       public          postgres    false    215    214            �           2604    16542    estadoresena idestadoresena    DEFAULT     �   ALTER TABLE ONLY public.estadoresena ALTER COLUMN idestadoresena SET DEFAULT nextval('public.estadoresena_idestadoresena_seq'::regclass);
 J   ALTER TABLE public.estadoresena ALTER COLUMN idestadoresena DROP DEFAULT;
       public          postgres    false    217    216            �           2604    16543    estadousuario idestadousuario    DEFAULT     �   ALTER TABLE ONLY public.estadousuario ALTER COLUMN idestadousuario SET DEFAULT nextval('public.estadousuario_idestadousuario_seq'::regclass);
 L   ALTER TABLE public.estadousuario ALTER COLUMN idestadousuario DROP DEFAULT;
       public          postgres    false    219    218            �           2604    16544 )   historialinventario idhistorialinventario    DEFAULT     �   ALTER TABLE ONLY public.historialinventario ALTER COLUMN idhistorialinventario SET DEFAULT nextval('public.historialinventario_idhistorialinventario_seq'::regclass);
 X   ALTER TABLE public.historialinventario ALTER COLUMN idhistorialinventario DROP DEFAULT;
       public          postgres    false    221    220            �           2604    16545 !   historialprecio idhistorialprecio    DEFAULT     �   ALTER TABLE ONLY public.historialprecio ALTER COLUMN idhistorialprecio SET DEFAULT nextval('public.historialprecio_idhistorialprecio_seq'::regclass);
 P   ALTER TABLE public.historialprecio ALTER COLUMN idhistorialprecio DROP DEFAULT;
       public          postgres    false    223    222            �           2604    16546 (   historialsesionadmon idhistorialsesion_a    DEFAULT     �   ALTER TABLE ONLY public.historialsesionadmon ALTER COLUMN idhistorialsesion_a SET DEFAULT nextval('public.historialsesionadmon_idhistorialsesion_a_seq'::regclass);
 W   ALTER TABLE public.historialsesionadmon ALTER COLUMN idhistorialsesion_a DROP DEFAULT;
       public          postgres    false    225    224            �           2604    16547 *   historialsesioncliente idhistorialsesion_c    DEFAULT     �   ALTER TABLE ONLY public.historialsesioncliente ALTER COLUMN idhistorialsesion_c SET DEFAULT nextval('public.historialsesioncliente_idhistorialsesion_c_seq'::regclass);
 Y   ALTER TABLE public.historialsesioncliente ALTER COLUMN idhistorialsesion_c DROP DEFAULT;
       public          postgres    false    227    226            �           2604    16548    imagenproducto idimagenproducto    DEFAULT     �   ALTER TABLE ONLY public.imagenproducto ALTER COLUMN idimagenproducto SET DEFAULT nextval('public.imagenproducto_idimagenproducto_seq'::regclass);
 N   ALTER TABLE public.imagenproducto ALTER COLUMN idimagenproducto DROP DEFAULT;
       public          postgres    false    229    228            �           2604    16549    inventario idinventario    DEFAULT     �   ALTER TABLE ONLY public.inventario ALTER COLUMN idinventario SET DEFAULT nextval('public.inventario_idinventario_seq'::regclass);
 F   ALTER TABLE public.inventario ALTER COLUMN idinventario DROP DEFAULT;
       public          postgres    false    231    230            �           2604    16550    marca idmarca    DEFAULT     n   ALTER TABLE ONLY public.marca ALTER COLUMN idmarca SET DEFAULT nextval('public.marca_idmarca_seq'::regclass);
 <   ALTER TABLE public.marca ALTER COLUMN idmarca DROP DEFAULT;
       public          postgres    false    233    232            �           2604    16551    pedido idpedido    DEFAULT     r   ALTER TABLE ONLY public.pedido ALTER COLUMN idpedido SET DEFAULT nextval('public.pedido_idpedido_seq'::regclass);
 >   ALTER TABLE public.pedido ALTER COLUMN idpedido DROP DEFAULT;
       public          postgres    false    235    234            �           2604    16552    precioantiguo idprecioantiguo    DEFAULT     �   ALTER TABLE ONLY public.precioantiguo ALTER COLUMN idprecioantiguo SET DEFAULT nextval('public.precioantiguo_idprecioantiguo_seq'::regclass);
 L   ALTER TABLE public.precioantiguo ALTER COLUMN idprecioantiguo DROP DEFAULT;
       public          postgres    false    237    236            �           2604    16553    producto idproducto    DEFAULT     z   ALTER TABLE ONLY public.producto ALTER COLUMN idproducto SET DEFAULT nextval('public.producto_idproducto_seq'::regclass);
 B   ALTER TABLE public.producto ALTER COLUMN idproducto DROP DEFAULT;
       public          postgres    false    239    238            �           2604    16554    puntuacion idpuntuacion    DEFAULT     �   ALTER TABLE ONLY public.puntuacion ALTER COLUMN idpuntuacion SET DEFAULT nextval('public.puntuacion_idpuntuacion_seq'::regclass);
 F   ALTER TABLE public.puntuacion ALTER COLUMN idpuntuacion DROP DEFAULT;
       public          postgres    false    241    240            �           2604    16555    resena idresena    DEFAULT     r   ALTER TABLE ONLY public.resena ALTER COLUMN idresena SET DEFAULT nextval('public.resena_idresena_seq'::regclass);
 >   ALTER TABLE public.resena ALTER COLUMN idresena DROP DEFAULT;
       public          postgres    false    243    242            �           2604    16556    subcategoria idsubcategoria    DEFAULT     �   ALTER TABLE ONLY public.subcategoria ALTER COLUMN idsubcategoria SET DEFAULT nextval('public.subcategoria_idsubcategoria_seq'::regclass);
 J   ALTER TABLE public.subcategoria ALTER COLUMN idsubcategoria DROP DEFAULT;
       public          postgres    false    245    244            �           2604    16557    talla idtalla    DEFAULT     n   ALTER TABLE ONLY public.talla ALTER COLUMN idtalla SET DEFAULT nextval('public.talla_idtalla_seq'::regclass);
 <   ALTER TABLE public.talla ALTER COLUMN idtalla DROP DEFAULT;
       public          postgres    false    247    246            �           2604    16558    tipousuario idtipousuario    DEFAULT     �   ALTER TABLE ONLY public.tipousuario ALTER COLUMN idtipousuario SET DEFAULT nextval('public.tipousuario_idtipousuario_seq'::regclass);
 H   ALTER TABLE public.tipousuario ALTER COLUMN idtipousuario DROP DEFAULT;
       public          postgres    false    249    248            }          0    16388    admon 
   TABLE DATA           �   COPY public.admon (idadmon, nombre, apellido, genero, correo, foto, fechanacimiento, telefono, direccion, usuario, "contraseña", idestadousuario, idtipousuario, dobleautenticacion, intentos, tokenclave, claverequest) FROM stdin;
    public          postgres    false    200   �                0    16393    bitacoracliente 
   TABLE DATA           b   COPY public.bitacoracliente (idbitacora, idcliente, fecha, hora, accion, descripcion) FROM stdin;
    public          postgres    false    202   z      �          0    16398    bitacorausuario 
   TABLE DATA           `   COPY public.bitacorausuario (idbitacora, idadmon, fecha, hora, accion, descripcion) FROM stdin;
    public          postgres    false    204   �      �          0    16403 	   categoria 
   TABLE DATA           C   COPY public.categoria (idcategoria, categoria, imagen) FROM stdin;
    public          postgres    false    206   R      �          0    16408    cliente 
   TABLE DATA           �   COPY public.cliente (idcliente, nombre, apellido, genero, correo, foto, fechanacimiento, telefono, direccion, usuario, "contraseña", idestadousuario, fecharegistro, intentos, tokenclave, claverequest, dobleautenticacion) FROM stdin;
    public          postgres    false    208   �      �          0    16413    detallepedido 
   TABLE DATA           h   COPY public.detallepedido (iddetallepedido, cantidad, precioproducto, idpedido, idproducto) FROM stdin;
    public          postgres    false    210   �      �          0    16421    estadomarca 
   TABLE DATA           A   COPY public.estadomarca (idestadomarca, estadomarca) FROM stdin;
    public          postgres    false    212   �      �          0    16426    estadopedido 
   TABLE DATA           D   COPY public.estadopedido (idestadopedido, estadopedido) FROM stdin;
    public          postgres    false    214         �          0    16431    estadoresena 
   TABLE DATA           D   COPY public.estadoresena (idestadoresena, estadoresena) FROM stdin;
    public          postgres    false    216   e      �          0    16436    estadousuario 
   TABLE DATA           G   COPY public.estadousuario (idestadousuario, estadousuario) FROM stdin;
    public          postgres    false    218   �      �          0    16441    historialinventario 
   TABLE DATA           c   COPY public.historialinventario (idhistorialinventario, idinventario, cantidad, fecha) FROM stdin;
    public          postgres    false    220   �      �          0    16449    historialprecio 
   TABLE DATA           W   COPY public.historialprecio (idhistorialprecio, idproducto, precio, fecha) FROM stdin;
    public          postgres    false    222         �          0    16457    historialsesionadmon 
   TABLE DATA           b   COPY public.historialsesionadmon (idhistorialsesion_a, idadmon, phpinfo, fechasesion) FROM stdin;
    public          postgres    false    224   e      �          0    16465    historialsesioncliente 
   TABLE DATA           f   COPY public.historialsesioncliente (idhistorialsesion_c, idcliente, phpinfo, fechasesion) FROM stdin;
    public          postgres    false    226   5      �          0    16473    imagenproducto 
   TABLE DATA           N   COPY public.imagenproducto (idimagenproducto, imagen, idproducto) FROM stdin;
    public          postgres    false    228   �      �          0    16478 
   inventario 
   TABLE DATA           Q   COPY public.inventario (idinventario, cantidad, idproducto, idtalla) FROM stdin;
    public          postgres    false    230   �      �          0    16483    marca 
   TABLE DATA           >   COPY public.marca (idmarca, marca, idestadomarca) FROM stdin;
    public          postgres    false    232         �          0    16488    pedido 
   TABLE DATA           R   COPY public.pedido (idpedido, fechapedido, idestadopedido, idcliente) FROM stdin;
    public          postgres    false    234   e      �          0    16493    precioantiguo 
   TABLE DATA           X   COPY public.precioantiguo (idprecioantiguo, idproducto, precio, fecha_hora) FROM stdin;
    public          postgres    false    236   �      �          0    16501    producto 
   TABLE DATA           u   COPY public.producto (idproducto, nombre, descripcion, precio, imagenprincipal, idsubcategoria, idmarca) FROM stdin;
    public          postgres    false    238   �      �          0    16509 
   puntuacion 
   TABLE DATA           >   COPY public.puntuacion (idpuntuacion, puntuacion) FROM stdin;
    public          postgres    false    240   J      �          0    16514    resena 
   TABLE DATA           �   COPY public.resena (idresena, comentario, idpuntuacion, respuesta, idproducto, idcliente, fecha, hora, idestadoresena) FROM stdin;
    public          postgres    false    242   �      �          0    16519    subcategoria 
   TABLE DATA           Y   COPY public.subcategoria (idsubcategoria, subcategoria, genero, idcategoria) FROM stdin;
    public          postgres    false    244   B      �          0    16524    talla 
   TABLE DATA           7   COPY public.talla (idtalla, talla, genero) FROM stdin;
    public          postgres    false    246   �      �          0    16529    tipousuario 
   TABLE DATA           A   COPY public.tipousuario (idtipousuario, tipousuario) FROM stdin;
    public          postgres    false    248         �           0    0    admon_idadmon_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.admon_idadmon_seq', 2, true);
          public          postgres    false    201            �           0    0    bitacoracliente_idbitacora_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.bitacoracliente_idbitacora_seq', 2, true);
          public          postgres    false    203            �           0    0    bitacorausuario_idbitacora_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.bitacorausuario_idbitacora_seq', 2, true);
          public          postgres    false    205            �           0    0    categoria_idcategoria_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.categoria_idcategoria_seq', 3, true);
          public          postgres    false    207            �           0    0    cliente_idcliente_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.cliente_idcliente_seq', 9, true);
          public          postgres    false    209            �           0    0 !   detallepedido_iddetallepedido_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.detallepedido_iddetallepedido_seq', 4, true);
          public          postgres    false    211            �           0    0    estadomarca_idestadomarca_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.estadomarca_idestadomarca_seq', 2, true);
          public          postgres    false    213            �           0    0    estadopedido_idestadopedido_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.estadopedido_idestadopedido_seq', 4, true);
          public          postgres    false    215            �           0    0    estadoresena_idestadoresena_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.estadoresena_idestadoresena_seq', 2, true);
          public          postgres    false    217            �           0    0 !   estadousuario_idestadousuario_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.estadousuario_idestadousuario_seq', 3, true);
          public          postgres    false    219            �           0    0 -   historialinventario_idhistorialinventario_seq    SEQUENCE SET     [   SELECT pg_catalog.setval('public.historialinventario_idhistorialinventario_seq', 3, true);
          public          postgres    false    221            �           0    0 %   historialprecio_idhistorialprecio_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.historialprecio_idhistorialprecio_seq', 11, true);
          public          postgres    false    223            �           0    0 ,   historialsesionadmon_idhistorialsesion_a_seq    SEQUENCE SET     Z   SELECT pg_catalog.setval('public.historialsesionadmon_idhistorialsesion_a_seq', 7, true);
          public          postgres    false    225            �           0    0 .   historialsesioncliente_idhistorialsesion_c_seq    SEQUENCE SET     \   SELECT pg_catalog.setval('public.historialsesioncliente_idhistorialsesion_c_seq', 3, true);
          public          postgres    false    227            �           0    0 #   imagenproducto_idimagenproducto_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.imagenproducto_idimagenproducto_seq', 1, false);
          public          postgres    false    229            �           0    0    inventario_idinventario_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.inventario_idinventario_seq', 1, true);
          public          postgres    false    231            �           0    0    marca_idmarca_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.marca_idmarca_seq', 5, true);
          public          postgres    false    233            �           0    0    pedido_idpedido_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.pedido_idpedido_seq', 5, true);
          public          postgres    false    235            �           0    0 !   precioantiguo_idprecioantiguo_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.precioantiguo_idprecioantiguo_seq', 1, false);
          public          postgres    false    237            �           0    0    producto_idproducto_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.producto_idproducto_seq', 2, true);
          public          postgres    false    239            �           0    0    puntuacion_idpuntuacion_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.puntuacion_idpuntuacion_seq', 5, true);
          public          postgres    false    241            �           0    0    resena_idresena_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.resena_idresena_seq', 6, true);
          public          postgres    false    243            �           0    0    subcategoria_idsubcategoria_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.subcategoria_idsubcategoria_seq', 5, true);
          public          postgres    false    245            �           0    0    talla_idtalla_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.talla_idtalla_seq', 11, true);
          public          postgres    false    247            �           0    0    tipousuario_idtipousuario_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.tipousuario_idtipousuario_seq', 3, true);
          public          postgres    false    249            �           2606    16560    admon admon_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.admon
    ADD CONSTRAINT admon_pkey PRIMARY KEY (idadmon);
 :   ALTER TABLE ONLY public.admon DROP CONSTRAINT admon_pkey;
       public            postgres    false    200            �           2606    16562 $   bitacoracliente bitacoracliente_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.bitacoracliente
    ADD CONSTRAINT bitacoracliente_pkey PRIMARY KEY (idbitacora);
 N   ALTER TABLE ONLY public.bitacoracliente DROP CONSTRAINT bitacoracliente_pkey;
       public            postgres    false    202            �           2606    16564 $   bitacorausuario bitacorausuario_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.bitacorausuario
    ADD CONSTRAINT bitacorausuario_pkey PRIMARY KEY (idbitacora);
 N   ALTER TABLE ONLY public.bitacorausuario DROP CONSTRAINT bitacorausuario_pkey;
       public            postgres    false    204            �           2606    16566    categoria categoria_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.categoria
    ADD CONSTRAINT categoria_pkey PRIMARY KEY (idcategoria);
 B   ALTER TABLE ONLY public.categoria DROP CONSTRAINT categoria_pkey;
       public            postgres    false    206            �           2606    16568    cliente cliente_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (idcliente);
 >   ALTER TABLE ONLY public.cliente DROP CONSTRAINT cliente_pkey;
       public            postgres    false    208            �           2606    16570     detallepedido detallepedido_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.detallepedido
    ADD CONSTRAINT detallepedido_pkey PRIMARY KEY (iddetallepedido);
 J   ALTER TABLE ONLY public.detallepedido DROP CONSTRAINT detallepedido_pkey;
       public            postgres    false    210            �           2606    16572    estadomarca estadomarca_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.estadomarca
    ADD CONSTRAINT estadomarca_pkey PRIMARY KEY (idestadomarca);
 F   ALTER TABLE ONLY public.estadomarca DROP CONSTRAINT estadomarca_pkey;
       public            postgres    false    212            �           2606    16574    estadopedido estadopedido_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.estadopedido
    ADD CONSTRAINT estadopedido_pkey PRIMARY KEY (idestadopedido);
 H   ALTER TABLE ONLY public.estadopedido DROP CONSTRAINT estadopedido_pkey;
       public            postgres    false    214            �           2606    16576    estadoresena estadoresena_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.estadoresena
    ADD CONSTRAINT estadoresena_pkey PRIMARY KEY (idestadoresena);
 H   ALTER TABLE ONLY public.estadoresena DROP CONSTRAINT estadoresena_pkey;
       public            postgres    false    216            �           2606    16578     estadousuario estadousuario_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.estadousuario
    ADD CONSTRAINT estadousuario_pkey PRIMARY KEY (idestadousuario);
 J   ALTER TABLE ONLY public.estadousuario DROP CONSTRAINT estadousuario_pkey;
       public            postgres    false    218            �           2606    16580 ,   historialinventario historialinventario_pkey 
   CONSTRAINT     }   ALTER TABLE ONLY public.historialinventario
    ADD CONSTRAINT historialinventario_pkey PRIMARY KEY (idhistorialinventario);
 V   ALTER TABLE ONLY public.historialinventario DROP CONSTRAINT historialinventario_pkey;
       public            postgres    false    220            �           2606    16582 $   historialprecio historialprecio_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public.historialprecio
    ADD CONSTRAINT historialprecio_pkey PRIMARY KEY (idhistorialprecio);
 N   ALTER TABLE ONLY public.historialprecio DROP CONSTRAINT historialprecio_pkey;
       public            postgres    false    222            �           2606    16584 .   historialsesionadmon historialsesionadmon_pkey 
   CONSTRAINT     }   ALTER TABLE ONLY public.historialsesionadmon
    ADD CONSTRAINT historialsesionadmon_pkey PRIMARY KEY (idhistorialsesion_a);
 X   ALTER TABLE ONLY public.historialsesionadmon DROP CONSTRAINT historialsesionadmon_pkey;
       public            postgres    false    224            �           2606    16586 2   historialsesioncliente historialsesioncliente_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.historialsesioncliente
    ADD CONSTRAINT historialsesioncliente_pkey PRIMARY KEY (idhistorialsesion_c);
 \   ALTER TABLE ONLY public.historialsesioncliente DROP CONSTRAINT historialsesioncliente_pkey;
       public            postgres    false    226            �           2606    16588 "   imagenproducto imagenproducto_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.imagenproducto
    ADD CONSTRAINT imagenproducto_pkey PRIMARY KEY (idimagenproducto);
 L   ALTER TABLE ONLY public.imagenproducto DROP CONSTRAINT imagenproducto_pkey;
       public            postgres    false    228            �           2606    16590    inventario inventario_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.inventario
    ADD CONSTRAINT inventario_pkey PRIMARY KEY (idinventario);
 D   ALTER TABLE ONLY public.inventario DROP CONSTRAINT inventario_pkey;
       public            postgres    false    230            �           2606    16592    marca marca_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.marca
    ADD CONSTRAINT marca_pkey PRIMARY KEY (idmarca);
 :   ALTER TABLE ONLY public.marca DROP CONSTRAINT marca_pkey;
       public            postgres    false    232            �           2606    16594    pedido pedido_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_pkey PRIMARY KEY (idpedido);
 <   ALTER TABLE ONLY public.pedido DROP CONSTRAINT pedido_pkey;
       public            postgres    false    234            �           2606    16596     precioantiguo precioantiguo_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.precioantiguo
    ADD CONSTRAINT precioantiguo_pkey PRIMARY KEY (idprecioantiguo);
 J   ALTER TABLE ONLY public.precioantiguo DROP CONSTRAINT precioantiguo_pkey;
       public            postgres    false    236            �           2606    16598    producto producto_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.producto
    ADD CONSTRAINT producto_pkey PRIMARY KEY (idproducto);
 @   ALTER TABLE ONLY public.producto DROP CONSTRAINT producto_pkey;
       public            postgres    false    238            �           2606    16600    puntuacion puntuacion_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.puntuacion
    ADD CONSTRAINT puntuacion_pkey PRIMARY KEY (idpuntuacion);
 D   ALTER TABLE ONLY public.puntuacion DROP CONSTRAINT puntuacion_pkey;
       public            postgres    false    240            �           2606    16602    resena resena_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.resena
    ADD CONSTRAINT resena_pkey PRIMARY KEY (idresena);
 <   ALTER TABLE ONLY public.resena DROP CONSTRAINT resena_pkey;
       public            postgres    false    242            �           2606    16604    subcategoria subcategoria_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.subcategoria
    ADD CONSTRAINT subcategoria_pkey PRIMARY KEY (idsubcategoria);
 H   ALTER TABLE ONLY public.subcategoria DROP CONSTRAINT subcategoria_pkey;
       public            postgres    false    244            �           2606    16606    talla talla_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.talla
    ADD CONSTRAINT talla_pkey PRIMARY KEY (idtalla);
 :   ALTER TABLE ONLY public.talla DROP CONSTRAINT talla_pkey;
       public            postgres    false    246            �           2606    16608    tipousuario tipousuario_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.tipousuario
    ADD CONSTRAINT tipousuario_pkey PRIMARY KEY (idtipousuario);
 F   ALTER TABLE ONLY public.tipousuario DROP CONSTRAINT tipousuario_pkey;
       public            postgres    false    248            �           2606    16610    admon uq_admon_correo 
   CONSTRAINT     R   ALTER TABLE ONLY public.admon
    ADD CONSTRAINT uq_admon_correo UNIQUE (correo);
 ?   ALTER TABLE ONLY public.admon DROP CONSTRAINT uq_admon_correo;
       public            postgres    false    200            �           2606    16612    admon uq_admon_usuario 
   CONSTRAINT     T   ALTER TABLE ONLY public.admon
    ADD CONSTRAINT uq_admon_usuario UNIQUE (usuario);
 @   ALTER TABLE ONLY public.admon DROP CONSTRAINT uq_admon_usuario;
       public            postgres    false    200            �           2606    16614    cliente uq_cliente_correo 
   CONSTRAINT     V   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT uq_cliente_correo UNIQUE (correo);
 C   ALTER TABLE ONLY public.cliente DROP CONSTRAINT uq_cliente_correo;
       public            postgres    false    208            �           2606    16616    cliente uq_cliente_usuario 
   CONSTRAINT     X   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT uq_cliente_usuario UNIQUE (usuario);
 D   ALTER TABLE ONLY public.cliente DROP CONSTRAINT uq_cliente_usuario;
       public            postgres    false    208            �           2620    16617 !   inventario tr_historialinventario    TRIGGER     �   CREATE TRIGGER tr_historialinventario BEFORE UPDATE ON public.inventario FOR EACH ROW EXECUTE FUNCTION public.sp_historialinventario();
 :   DROP TRIGGER tr_historialinventario ON public.inventario;
       public          postgres    false    230    250            �           2620    16618    producto tr_historialprecio    TRIGGER     ~   CREATE TRIGGER tr_historialprecio BEFORE UPDATE ON public.producto FOR EACH ROW EXECUTE FUNCTION public.sp_historialprecio();
 4   DROP TRIGGER tr_historialprecio ON public.producto;
       public          postgres    false    251    238            �           2606    16619     admon admon_idestadousuario_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.admon
    ADD CONSTRAINT admon_idestadousuario_fkey FOREIGN KEY (idestadousuario) REFERENCES public.estadousuario(idestadousuario);
 J   ALTER TABLE ONLY public.admon DROP CONSTRAINT admon_idestadousuario_fkey;
       public          postgres    false    200    218    3010            �           2606    16624    admon admon_idtipousuario_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.admon
    ADD CONSTRAINT admon_idtipousuario_fkey FOREIGN KEY (idtipousuario) REFERENCES public.tipousuario(idtipousuario);
 H   ALTER TABLE ONLY public.admon DROP CONSTRAINT admon_idtipousuario_fkey;
       public          postgres    false    200    3040    248            �           2606    16629 .   bitacoracliente bitacoracliente_idcliente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.bitacoracliente
    ADD CONSTRAINT bitacoracliente_idcliente_fkey FOREIGN KEY (idcliente) REFERENCES public.cliente(idcliente);
 X   ALTER TABLE ONLY public.bitacoracliente DROP CONSTRAINT bitacoracliente_idcliente_fkey;
       public          postgres    false    208    202    2996            �           2606    16634 ,   bitacorausuario bitacorausuario_idadmon_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.bitacorausuario
    ADD CONSTRAINT bitacorausuario_idadmon_fkey FOREIGN KEY (idadmon) REFERENCES public.admon(idadmon);
 V   ALTER TABLE ONLY public.bitacorausuario DROP CONSTRAINT bitacorausuario_idadmon_fkey;
       public          postgres    false    2984    200    204            �           2606    16639 $   cliente cliente_idestadousuario_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_idestadousuario_fkey FOREIGN KEY (idestadousuario) REFERENCES public.estadousuario(idestadousuario);
 N   ALTER TABLE ONLY public.cliente DROP CONSTRAINT cliente_idestadousuario_fkey;
       public          postgres    false    208    218    3010            �           2606    16644 )   detallepedido detallepedido_idpedido_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.detallepedido
    ADD CONSTRAINT detallepedido_idpedido_fkey FOREIGN KEY (idpedido) REFERENCES public.pedido(idpedido);
 S   ALTER TABLE ONLY public.detallepedido DROP CONSTRAINT detallepedido_idpedido_fkey;
       public          postgres    false    210    234    3026            �           2606    16649 +   detallepedido detallepedido_idproducto_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.detallepedido
    ADD CONSTRAINT detallepedido_idproducto_fkey FOREIGN KEY (idproducto) REFERENCES public.producto(idproducto);
 U   ALTER TABLE ONLY public.detallepedido DROP CONSTRAINT detallepedido_idproducto_fkey;
       public          postgres    false    238    210    3030            �           2606    16654 9   historialinventario historialinventario_idinventario_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.historialinventario
    ADD CONSTRAINT historialinventario_idinventario_fkey FOREIGN KEY (idinventario) REFERENCES public.inventario(idinventario);
 c   ALTER TABLE ONLY public.historialinventario DROP CONSTRAINT historialinventario_idinventario_fkey;
       public          postgres    false    3022    220    230            �           2606    16659 6   historialsesionadmon historialsesionadmon_idadmon_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.historialsesionadmon
    ADD CONSTRAINT historialsesionadmon_idadmon_fkey FOREIGN KEY (idadmon) REFERENCES public.admon(idadmon);
 `   ALTER TABLE ONLY public.historialsesionadmon DROP CONSTRAINT historialsesionadmon_idadmon_fkey;
       public          postgres    false    2984    200    224            �           2606    16664 <   historialsesioncliente historialsesioncliente_idcliente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.historialsesioncliente
    ADD CONSTRAINT historialsesioncliente_idcliente_fkey FOREIGN KEY (idcliente) REFERENCES public.cliente(idcliente);
 f   ALTER TABLE ONLY public.historialsesioncliente DROP CONSTRAINT historialsesioncliente_idcliente_fkey;
       public          postgres    false    226    208    2996            �           2606    16669 -   imagenproducto imagenproducto_idproducto_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.imagenproducto
    ADD CONSTRAINT imagenproducto_idproducto_fkey FOREIGN KEY (idproducto) REFERENCES public.producto(idproducto);
 W   ALTER TABLE ONLY public.imagenproducto DROP CONSTRAINT imagenproducto_idproducto_fkey;
       public          postgres    false    3030    228    238            �           2606    16674 %   inventario inventario_idproducto_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventario
    ADD CONSTRAINT inventario_idproducto_fkey FOREIGN KEY (idproducto) REFERENCES public.producto(idproducto);
 O   ALTER TABLE ONLY public.inventario DROP CONSTRAINT inventario_idproducto_fkey;
       public          postgres    false    230    238    3030            �           2606    16679 "   inventario inventario_idtalla_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.inventario
    ADD CONSTRAINT inventario_idtalla_fkey FOREIGN KEY (idtalla) REFERENCES public.talla(idtalla);
 L   ALTER TABLE ONLY public.inventario DROP CONSTRAINT inventario_idtalla_fkey;
       public          postgres    false    230    246    3038            �           2606    16684    marca marca_idestadomarca_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.marca
    ADD CONSTRAINT marca_idestadomarca_fkey FOREIGN KEY (idestadomarca) REFERENCES public.estadomarca(idestadomarca);
 H   ALTER TABLE ONLY public.marca DROP CONSTRAINT marca_idestadomarca_fkey;
       public          postgres    false    3004    232    212            �           2606    16689    pedido pedido_idcliente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_idcliente_fkey FOREIGN KEY (idcliente) REFERENCES public.cliente(idcliente);
 F   ALTER TABLE ONLY public.pedido DROP CONSTRAINT pedido_idcliente_fkey;
       public          postgres    false    208    234    2996            �           2606    16694 !   pedido pedido_idestadopedido_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_idestadopedido_fkey FOREIGN KEY (idestadopedido) REFERENCES public.estadopedido(idestadopedido);
 K   ALTER TABLE ONLY public.pedido DROP CONSTRAINT pedido_idestadopedido_fkey;
       public          postgres    false    214    234    3006            �           2606    16699 +   precioantiguo precioantiguo_idproducto_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.precioantiguo
    ADD CONSTRAINT precioantiguo_idproducto_fkey FOREIGN KEY (idproducto) REFERENCES public.producto(idproducto);
 U   ALTER TABLE ONLY public.precioantiguo DROP CONSTRAINT precioantiguo_idproducto_fkey;
       public          postgres    false    236    3030    238            �           2606    16704    producto producto_idmarca_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.producto
    ADD CONSTRAINT producto_idmarca_fkey FOREIGN KEY (idmarca) REFERENCES public.marca(idmarca);
 H   ALTER TABLE ONLY public.producto DROP CONSTRAINT producto_idmarca_fkey;
       public          postgres    false    3024    232    238            �           2606    16709 %   producto producto_idsubcategoria_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.producto
    ADD CONSTRAINT producto_idsubcategoria_fkey FOREIGN KEY (idsubcategoria) REFERENCES public.subcategoria(idsubcategoria);
 O   ALTER TABLE ONLY public.producto DROP CONSTRAINT producto_idsubcategoria_fkey;
       public          postgres    false    244    3036    238            �           2606    16714    resena resena_idcliente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.resena
    ADD CONSTRAINT resena_idcliente_fkey FOREIGN KEY (idcliente) REFERENCES public.cliente(idcliente);
 F   ALTER TABLE ONLY public.resena DROP CONSTRAINT resena_idcliente_fkey;
       public          postgres    false    2996    242    208            �           2606    16719 !   resena resena_idestadoresena_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.resena
    ADD CONSTRAINT resena_idestadoresena_fkey FOREIGN KEY (idestadoresena) REFERENCES public.estadoresena(idestadoresena);
 K   ALTER TABLE ONLY public.resena DROP CONSTRAINT resena_idestadoresena_fkey;
       public          postgres    false    242    3008    216            �           2606    16724    resena resena_idproducto_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.resena
    ADD CONSTRAINT resena_idproducto_fkey FOREIGN KEY (idproducto) REFERENCES public.producto(idproducto);
 G   ALTER TABLE ONLY public.resena DROP CONSTRAINT resena_idproducto_fkey;
       public          postgres    false    242    3030    238            �           2606    16729    resena resena_idpuntuacion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.resena
    ADD CONSTRAINT resena_idpuntuacion_fkey FOREIGN KEY (idpuntuacion) REFERENCES public.puntuacion(idpuntuacion);
 I   ALTER TABLE ONLY public.resena DROP CONSTRAINT resena_idpuntuacion_fkey;
       public          postgres    false    3032    240    242            �           2606    16734 *   subcategoria subcategoria_idcategoria_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.subcategoria
    ADD CONSTRAINT subcategoria_idcategoria_fkey FOREIGN KEY (idcategoria) REFERENCES public.categoria(idcategoria);
 T   ALTER TABLE ONLY public.subcategoria DROP CONSTRAINT subcategoria_idcategoria_fkey;
       public          postgres    false    206    2994    244            }   �   x�-���0F��S0���"�ğ� c�J+V��0�Z>�/&���v������pm/^��JQA�y��eoe'�k���wFvD��TLV��
:*��0:�k]��8r�w=�`��C�;�������;����jyc�����$�>8<�*�,��~�6����v��m�E������ʉeY_E�?�         \   x�}˱� ���� �G0Gg\���cb���m�|�c
�V43Y�^��p2���R�O:hJ�R�n-]n�.
�	��H��l�R/��      �   \   x�3�4�4202�5��54�4��2��21�3�443�tL.)M�ɬJ,�tN�M��WHIUH�I,K�2B�h�ihdelhed�gnbjjf�Og� ؃�      �   V   x�3�t.�LIL�WpKL�L��43HK6�L2O�L3��+�K�2��M,,���I�J�J'%�&���9��a�F�ɩ`�=... s4�      �   �  x����R�0���)�`Y'�%��k(	�4�ma�(�p�ؖ#ن�m� ]��X�	�a��e�.����#4�����ΕF���2�9��ӟ���W��5Z�D�2�9ɄJ;s���ۇ d�qF���˙�H�.��G�O�����T�E!�Dr�"�7�E��V���)"��i�c�0�=�&�G�����>=Z�&r-��Ed��h 3�7��Xhӌ|1t1q)F#�LQ�������	�!!Em�sV�X�U!�	@�r㌀)��WL���Ώ�rs�� �<7�����vӼ��a�!,��Z	gT��) �A���)�c�ϥ�oJ����R6���h+��f�����B^J��LYݨ��6���Vef0ʹ���y0���E���8D�3����M6��8����)�s)2�
t�שܕ�+�x��$4bs�%���� ܂B��j�e��t�co}L�-��,�����Z_��w����첛�uo|�����8���g�L���S%��cHwju�&"S
��0���78<��N�z��W ެ�򡅿��Z�'�e���㓴��;wl�,��g�/nR_���Z.g�ugu���G��&���L��� �	\&F����;2�~c!���\�V��18ks�Q$ll�D�\lwk�a���+�.��dͻ�m�'U�We�U��*�f?�߮D��s~-��پ�"��Z~n;GGG� ā��      �   .   x�3�4��30�4�4�2�4�p��c 	� 9&0�)����� ���      �   !   x�3�t�,.���L�I�2���WHA�c���� ��
A      �   9   x�3�tL.�,��2�t��-�I-IL��2�tN�KN��M8]�
��S��b���� ��u      �       x�3��,�L�I�2��O.�)������ Xfv      �   (   x�3�tL.�,��2���K�0�9�r�KSS�b���� Ԇ
�      �   )   x�3�4�4�4202�5��50�2
�!,�b���� �C�      �   O   x�mα� C����-�v��s��
���WZ���@���%�8�.Z�B��>*�C�9�2��I^�t�lC����\%      �   �   x�M�K�0�s�+��!a7���&TOV�^iM�`m���"�m�og�`��>���1�6�e6�"�w_;hMD�KL��̚@�fIIa;e��u{(�c{�A+����ٝ�cL.yq�0�8%��j��Aoc�#�D�#]U���Q�(����y��|��*}�|����Q"�� ������;%�xJo;l      �   �   x�M̽
�0��9��\�!�4��X��U�A�!�q�b/_����c����������?w��&�)�#�!"���D�{g�!ÊZ�$���Iy�����դ�V�#:�����ǐ��Tn��P,J��)17��y�R�w�'&      �      x������ � �      �      x�3�44�4�4����� ;�      �   @   x�3�tL�LI,�4�2���˩2�9}�s|�SK�|N���T Ô�9'�8�Ȍ���� ��      �   ,   x�3�4202�50�52�4�4�2A0F0
�"b���� ��b      �      x������ � �      �   |   x�3�t�	vTru	vvp�L,N"NK=N3��$�4#�TCSS���tNcN#.#Ng� '?G��0GN����Ģ̜�D��T�Ģ��<��̲Ĕ|NC�Q�F�ff&P���b���� G"�      �   /   x�3�4TH-.)J��I�2�4�s���9��x&�&H<SNS$^� N�>      �   �   x�u�M
�0���^��g��}��n�����=~#���
o���C8=�4�ۚ��<�[�N О��Ҹ��C�r4�G��8~L�߰c�0�dTAz�
dM����/q��]0�k�<JM*�mY��u���abz��3�;���9�1�!Mb�m�VJ=�}F�      �   X   x�U˱
� ����	������hk����TІ>������*��HO�P�Xl%�JLL����d��Ğc���s��}�~��D���j      �   Q   x�3��tI�M�2���srR��9��&��¦��a3 !l��� 2�PqC!ch����\1z\\\ �#G      �   1   x�3�tL����,.)JL�/�2�t�-�I���9�R�J2A�1z\\\ U�     