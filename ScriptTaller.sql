BEGIN;


CREATE TABLE IF NOT EXISTS public.categorias
(
    id_categoria character varying NOT NULL,
    cod_categoria character varying NOT NULL,
    nom_categoria character varying NOT NULL,
    CONSTRAINT categorias_pkey PRIMARY KEY (id_categoria),
    CONSTRAINT fk_unique_categoria_code UNIQUE (cod_categoria)
);

CREATE TABLE IF NOT EXISTS public.factura_pedido
(
    id_factura integer NOT NULL,
    cod_pieza character varying NOT NULL,
    cantidad character varying NOT NULL,
    cod_factura character varying NOT NULL,
    cod_pedido character varying NOT NULL,
    CONSTRAINT factura_pedido_pkey PRIMARY KEY (id_factura),
    CONSTRAINT fk_unique_factura_code UNIQUE (cod_pedido)
);

CREATE TABLE IF NOT EXISTS public.pedidos_proveedor
(
    id_pedido integer NOT NULL,
    cod_proveedor character varying NOT NULL,
    fecha date NOT NULL,
    cod_pedido character varying NOT NULL,
    CONSTRAINT pedidos_proveedor_pkey PRIMARY KEY (id_pedido)
);

CREATE TABLE IF NOT EXISTS public.piezas
(
    id_pieza integer NOT NULL,
    cod_pieza character varying NOT NULL,
    name_pieza character varying NOT NULL,
    color character varying NOT NULL,
    precio character varying NOT NULL,
    cod_categoria character varying NOT NULL,
    CONSTRAINT piezas_pkey PRIMARY KEY (id_pieza),
    CONSTRAINT fk_unique_pieza_code UNIQUE (cod_pieza)
);

CREATE TABLE IF NOT EXISTS public.proveedores
(
    id_proveedor integer NOT NULL,
    direccion character varying(100) NOT NULL,
    ciudad character varying NOT NULL,
    provincia character varying[] NOT NULL,
    cod_proveedor character varying NOT NULL,
    CONSTRAINT proveedores_pkey PRIMARY KEY (id_proveedor),
    CONSTRAINT fk_unique_proveedor_code UNIQUE (cod_proveedor)
);

ALTER TABLE IF EXISTS public.factura_pedido
    ADD CONSTRAINT fk__pieza__code FOREIGN KEY (cod_pieza)
    REFERENCES public.piezas (cod_pieza) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.pedidos_proveedor
    ADD CONSTRAINT fk__factura__code FOREIGN KEY (cod_pedido)
    REFERENCES public.factura_pedido (cod_pedido) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.pedidos_proveedor
    ADD CONSTRAINT fk__proveedor__code FOREIGN KEY (cod_proveedor)
    REFERENCES public.proveedores (cod_proveedor) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.piezas
    ADD CONSTRAINT fk__categoria__code FOREIGN KEY (cod_categoria)
    REFERENCES public.categorias (cod_categoria) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;

END;