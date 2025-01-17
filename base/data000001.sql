/***********************************I-DAT-GSS-TES-45-02/04/2013*****************************************/

/*
*	Author: Gonzalo Sarmiento Sejas GSS
*	Date: 02/04/2013
*	Description: Build the menu definition and the composition
*/
/*

Para  definir la la metadata, menus, roles, etc

1) sincronize ls funciones y procedimientos del sistema
2)  verifique que la primera linea de los datos sea la insercion del sistema correspondiente
3)  exporte los datos a archivo SQL (desde la interface de sistema en sis_seguridad),
    verifique que la codificacion  se mantenga en UTF8 para no distorcionar los caracteres especiales
4)  remplaze los sectores correspondientes en este archivo en su totalidad:  (el orden es importante)
                             menu,
                             funciones,
                             procedimietnos
*/

INSERT INTO segu.tsubsistema ( codigo, nombre, prefijo, estado_reg, nombre_carpeta, id_subsis_orig)
VALUES ('TES', 'Sistema de Tesoreria', 'TES', 'activo', 'tesoreria', NULL) ON CONFLICT  (codigo) WHERE estado_reg = 'activo' DO NOTHING;

-------------------------------------
--DEFINICION DE INTERFACES
-----------------------------------
select pxp.f_insert_tgui ('<i class="fa fa-money fa-2x"></i> TESORERIA', '', 'TES', 'si', 9, '', 1, '', '', 'TES');
select pxp.f_insert_tgui ('Obligacion Pago', 'Obligaciones de pago', 'OBPG', 'si', 0, 'sis_tesoreria/vista/obligacion_pago/ObligacionPagoTes.php', 2, '', 'ObligacionPagoTes', 'TES');
select pxp.f_insert_tgui ('Cuenta Bancaria', 'cuentas bancarias de la empresa', 'CTABAN', 'si', 0, 'sis_tesoreria/vista/cuenta_bancaria/CuentaBancaria.php', 2, '', 'CuentaBancaria', 'TES');
select pxp.f_insert_tgui ('Caja', 'Caja', 'CAJA', 'si', 13, 'sis_tesoreria/vista/caja/CajaCajero.php', 2, '', 'CajaCajero', 'TES');
select pxp.f_insert_tgui ('Libro de Bancos', 'cuentas bancarias de la empresa', 'CTABANE', 'si', 1, 'sis_tesoreria/vista/cuenta_bancaria/CuentaBancariaESIS.php', 2, '', 'CuentaBancariaESIS', 'TES');
select pxp.f_insert_tgui ('Visto Bueno de Pagos', 'Visto bueno de Devengaso y/o Pagos', 'VBDP', 'si', 0, 'sis_tesoreria/vista/plan_pago/PlanPagoVb.php', 2, '', 'PlanPagoVb', 'TES');
select pxp.f_insert_tgui ('Solicitud de Obligacion de Pago  (Con Contrato)', 'Solicitud de Pago Directos', 'SOLPD', 'si', 0, 'sis_tesoreria/vista/obligacion_pago/ObligacionPagoSol.php', 2, '', 'ObligacionPagoSol', 'TES');
select pxp.f_insert_tgui ('Tipo Plan Pago', 'Configuracion de  tipos de Plan de Pago', 'TIPP', 'si', 0, 'sis_tesoreria/vista/tipo_plan_pago/TipoPlanPago.php', 2, '', 'TipoPlanPago', 'TES');
select pxp.f_insert_tgui ('Depósitos y Cheques', 'cuenta bancaria endesis', 'CTABANCEND', 'si', 1, 'sis_tesoreria/vista/cuenta_bancaria/CuentaBancariaENDESIS.php', 2, '', 'CuentaBancariaENDESIS', 'TES');
select pxp.f_insert_tgui ('Revision de VoBo Pago (Asistentes)', 'Revision de VoBo Pago (Asistentes)', 'REVBPP', 'si', 0, 'sis_tesoreria/vista/plan_pago/PlanPagoVbAsistente.php', 2, '', 'PlanPagoVbAsistente', 'TES');
select pxp.f_insert_tgui ('VoBo Obligacion de Pago (Liberación Obli)', 'VoBo Obligacion de Pago (Presupuestos)', 'VBOP', 'si', 4, 'sis_tesoreria/vista/obligacion_pago/ObligacionPagoVb.php', 2, '', 'ObligacionPagoVb', 'TES');
select pxp.f_insert_tgui ('Tipo Prorrateo', 'Tipo Prorrateo', 'TIPPRO', 'si', 0, 'sis_tesoreria/vista/tipo_prorrateo/TipoProrrateo.php', 2, '', 'TipoProrrateo', 'TES');
select pxp.f_insert_tgui ('Reportes', 'Reportes', 'REPOP', 'si', 0, '', 2, '', '', 'TES');
select pxp.f_insert_tgui ('Reporte Pagos X Concepto', 'Reporte Pagos X Concepto', 'REPPAGCON', 'si', 1, 'sis_tesoreria/reportes/formularios/PagosConcepto.php', 3, '', 'PagosConcepto', 'TES');
select pxp.f_insert_tgui ('Obligaciones de pago (Contabilidad)', 'Obligaciones de pago (Contabilidad)', 'OPCONTA', 'si', 10, 'sis_tesoreria/vista/obligacion_pago/ObligacionPagoConta.php', 2, '', 'ObligacionPagoConta', 'TES');
select pxp.f_insert_tgui ('Consulta Obligacion de Pago', 'Consulta Obligacion de Pago', 'CONOP', 'si', 11, 'sis_tesoreria/vista/obligacion_pago/ObligacionPagoConsulta.php', 2, '', 'ObligacionPagoConsulta', 'TES');
select pxp.f_insert_tgui ('Visto Bueno de Pagos (Conta)', 'Visto Bueno de Pagos (Conta)', 'VBPDC', 'si', 0, 'sis_tesoreria/vista/plan_pago/PlanPagoVbConta.php', 2, '', 'PlanPagoVbConta', 'TES');
select pxp.f_insert_tgui ('Solicitud de Pago Único  (Sin contrato)', 'Solicitud de Pago Único  (Sin contrato)', 'OPUNI', 'si', 0, 'sis_tesoreria/vista/obligacion_pago/ObligacionPagoUnico.php', 2, '', 'ObligacionPagoUnico', 'TES');
select pxp.f_insert_tgui ('VoBo Obligaciones de Pago (POA)', '', 'VBOPOA', 'si', 0, 'sis_tesoreria/vista/obligacion_pago/ObligacionPagoVbPoa.php', 3, '', 'ObligacionPagoVbPoa', 'TES');
select pxp.f_insert_tgui ('Reporte de Pagos', 'Reporte de pagos', 'REPPP', 'si', 4, 'sis_tesoreria/vista/plan_pago/RepFilPlanPago.php', 3, '', 'RepFilPlanPago', 'TES');
select pxp.f_insert_tgui ('Solicitud Apertura/Cierre Caja', 'Solicitud Apertura/Cierre Caja', 'SOLCAJA', 'si', 1, 'sis_tesoreria/vista/caja/CajaSolicitud.php', 2, '', 'CajaSolicitud', 'TES');
select pxp.f_insert_tgui ('Visto Bueno Apertura Cajas', 'Visto bueno apertura cajas', 'VBCAJA', 'si', 2, 'sis_tesoreria/vista/caja/CajaVB.php', 2, '', 'CajaVb', 'TES');
select pxp.f_insert_tgui ('Solicitud Efectivo Con Detalle', 'Solicitud Efectivo', 'SOLEFE', 'si', 6, 'sis_tesoreria/vista/solicitud_efectivo/SolicitudEfectivo.php', 2, '', 'SolicitudEfectivo', 'TES');
select pxp.f_insert_tgui ('Solicitud Efectivo Simple', 'Solicitud Efectivo Simple', 'SOLEFESD', 'si', 5, 'sis_tesoreria/vista/solicitud_efectivo/SolicitudEfectivoSinDet.php', 2, '', 'SolicitudEfectivoSinDet', 'TES');
select pxp.f_insert_tgui ('Visto Bueno Solicitud Efectivo', 'Visto Bueno Solicitud Efectivo', 'VBSOLEFE', 'si', 7, 'sis_tesoreria/vista/solicitud_efectivo/SolicitudEfectivoVb.php', 2, '', 'SolicitudEfectivoVb', 'TES');
select pxp.f_insert_tgui ('Visto Bueno Cajas Rendiciones', 'Visto Bueno Cajas Rendiciones', 'VBRENCJ', 'si', 9, 'sis_tesoreria/vista/proceso_caja/ProcesoCajaVb.php', 2, '', 'ProcesoCajaVb', 'TES');
select pxp.f_insert_tgui ('Reporte de Pagos Basico', 'RPB', 'REPPPBA', 'si', 6, 'sis_tesoreria/vista/plan_pago/ReportePagosSimple.php', 3, '', 'ReportePagosSimple', 'TES');
select pxp.f_insert_tgui ('Proceso Con Retencion 7%', 'Proceso Con Retencion 7%', 'PRCRE', 'si', 7, 'sis_tesoreria/vista/reporte_proceso_con_retencion/ProcesoConRetencion.php', 3, '', 'ProcesoConRetencion', 'TES');
select pxp.f_insert_tgui ('Procesos Pendientes', 'PP', 'PP', 'si', 8, 'sis_tesoreria/vista/reporte_procesos_pendientes/ProcesosPendientes.php', 3, '', 'ProcesosPendientes', 'TES');
select pxp.f_insert_tgui ('Procesos Pendientes Contabilidad', 'Procesos Pendientes Contabilidad', 'PPC', 'si', 9, 'sis_tesoreria/vista/reporte_procesos_pendientes/ProcesoPendienteContabilidad.php', 3, '', 'ProcesoPendienteContabilidad', 'TES');
select pxp.f_insert_tgui ('Victo bueno de Pagos (Costos)', 'Visto bueno de pagos costos', 'VBPCOS', 'si', 0, 'sis_tesoreria/vista/plan_pago/PlanPagoVbCostos.php', 2, '', 'PlanPagoVbCostos', 'TES');
select pxp.f_insert_tgui ('Excepciones de conceptos', 'Ecepciones de concepto de gasto', 'CONEX', 'si', 0, 'sis_tesoreria/vista/concepto_excepcion/ConceptoExcepcion.php', 3, '', 'ConceptoExcepcion', 'TES');
select pxp.f_insert_tgui ('Obligaciones de Pago', 'Obligaciones de Pago', 'CAROP', 'si', 2, '', 2, '', '', 'TES');
select pxp.f_insert_tgui ('Libro de Bancos', 'Libro de Bancos', 'CARLB', 'si', 5, '', 2, '', '', 'TES');
select pxp.f_insert_tgui ('Fondos Rotatorios', 'Fondos Rotatorios', 'CARFR', 'si', 3, '', 2, '', '', 'TES');
select pxp.f_insert_tgui ('Configuraciones', 'Configuraciones', 'CAOPCOFG', 'si', 1, '', 3, '', '', 'TES');
select pxp.f_insert_tgui ('Solicitudes', 'Solucitudes de pago', 'CAROPSOL', 'si', 2, '', 3, '', '', 'TES');
select pxp.f_insert_tgui ('VoBo', 'VoBo', 'CAROPVB', 'si', 3, '', 3, '', '', 'TES');
select pxp.f_insert_tgui ('Reporte Libro Bancos', 'reporte libro bancos', 'REPLB', 'si', 0, 'sis_tesoreria/reportes/formularios/LibroBancos.php', 3, '', 'ReporteLibroBancos', 'TES');
select pxp.f_insert_tgui ('Finalidad', 'Finalidad de cuentas bancarias', 'FINCUE', 'si', 1, 'sis_tesoreria/vista/finalidad/Finalidad.php', 3, '', 'Finalidad', 'TES');
select pxp.f_insert_tgui ('Tipo Proceso Caja', 'Tipo Proceso Caja', 'TPC', 'si', 0, 'sis_tesoreria/vista/tipo_proceso_caja/TipoProcesoCaja.php', 3, '', 'TipoProcesoCaja', 'TES');
select pxp.f_insert_tgui ('VoBo Repo Cajas (Fondos)', 'VoBo Repo Cajas (Fondos)', 'VBCJ', 'si', 3, 'sis_tesoreria/vista/proceso_caja/ProcesoCajaVbFondos.php', 3, '', 'ProcesoCajaVbFondos', 'TES');
select pxp.f_insert_tgui ('VoBo Rend Caja (Presup)', 'VoBo Rend Caja (Presup)', 'VBCP', 'si', 3, 'sis_tesoreria/vista/proceso_caja/ProcesoCajaVbPresup.php', 3, '', 'ProcesoCajaVbPresup', 'TES');
select pxp.f_insert_tgui ('Tipo Solicitud', 'Tipo Solicitud', 'TPSOL', 'si', 0, 'sis_tesoreria/vista/tipo_solicitud/TipoSolicitud.php', 3, '', 'TipoSolicitud', 'TES');
select pxp.f_insert_tgui ('Visto Bueno Facturas Rendicion', 'Visto Bueno Facturas Rendicion', 'VBFACREN', 'si', 8, 'sis_tesoreria/vista/rendicion_efectivo/RendicionEfectivo.php', 3, '', 'RendicionEfectivo', 'TES');
select pxp.f_insert_tgui ('VoBo Rend/Repo Cajas (Conta)', 'VoBo Rend/Repo Cajas (Conta)', 'VBRENCJA', 'si', 12, 'sis_tesoreria/vista/proceso_caja/ProcesoCajaVbConta.php', 3, '', 'ProcesoCajaVbConta', 'TES');
select pxp.f_insert_tgui ('Configuraciones', 'Configuraciones', 'COFCAJA', 'si', 1, '', 3, '', '', 'TES');
select pxp.f_insert_tgui ('Ingresos de Caja', 'Ingreso de Caja', 'INGCAJ', 'si', 14, 'sis_tesoreria/vista/solicitud_efectivo/SolicitudIngreso.php', 3, '', 'SolicitudIngreso', 'TES');
select pxp.f_insert_tgui ('Reportes', 'Reportes varios Caja', 'TESREPFR', 'si', 1, '', 2, '', '', 'TES');
select pxp.f_insert_tgui ('Movimiento de Caja', 'Reporte Movimiento de Caja', 'REPMOVCA', 'si', 14, 'sis_tesoreria/vista/reportes/RepMovimientoCaja.php', 2, '', 'RepMovimientoCaja', 'TES');
select pxp.f_insert_tgui ('Solicitud de Transferencia', 'Solicitud de Transferencia', 'TESOLTRA', 'si', 4, 'sis_tesoreria/vista/solicitud_transferencia/SolicitudTransferencia.php', 3, '', 'SolicitudTransferencia', 'TES');
select pxp.f_insert_tgui ('Aprobacion Transferencia', 'Aprobacion Transferencia', 'TEAPROTRA', 'si', 0, 'sis_tesoreria/vista/solicitud_transferencia/SolicitudTransferenciaAprobacion.php', 4, '', 'SolicitudTransferenciaAprobacion', 'TES');
select pxp.f_insert_tgui ('Reporte Libro Banco', 'Reporte Libro Banco', 'REPLIB', 'si', 9, 'sis_tesoreria/reportes/formularios/RepLibroBanco.php', 3, '', 'RepLibroBanco', 'TES');
select pxp.f_insert_tgui ('Solicitud de Pago (Sin presupuesto)', 'Pagos sin presupeusto', 'PAGESP', 'si', 5, 'sis_tesoreria/vista/obligacion_pago/ObligacionPagoEspecial.php', 4, '', 'ObligacionPagoEspecial', 'TES');
select pxp.f_insert_tgui ('Reporte de Caja Rango Fechas', 'Reporte de caja Rango Fechas', 'RCRF', 'si', 12, 'sis_tesoreria/reportes/formularios/RepCajaRango.php', 3, '', 'RepCajaRango', 'TES');




-----------------------------
-- DOCUMENTOS
---------------------------------


--inserta documentos de adquisiciones

SELECT * FROM param.f_inserta_documento('TES', 'PGD', 'Pago Directo', 'periodo', NULL, 'depto', NULL);
SELECT * FROM param.f_inserta_documento('TES', 'SPG', 'Solicitud de Pago', 'periodo', NULL, 'depto', NULL);


/***********************************F-DAT-GSS-TES-45-02/04/2013*******************************************************/


/********************************************I-DAT-GSS-TES-14-12/04/2013**********************************************/

----------------------------------
--COPY LINES TO data.sql FILE
---------------------------------

select wf.f_insert_tproceso_macro ('TES-PD', 'Pago Directo', 'si', 'activo', 'Sistema de Tesoreria');
select wf.f_insert_ttipo_proceso ('', 'Obligacion de Pago', 'TOPD', 'tes.tobligacion_pago', 'id_obligacion_pago', 'activo', 'si', 'TES-PD');
select wf.f_insert_ttipo_proceso ('En pago', 'Tesoreria Plan Pago, Devengado', 'TPLAP', '', '', 'activo', 'no', 'TES-PD');
select wf.f_insert_ttipo_proceso ('devengado', 'Tesoreria Plan Pago, Pagado', 'TPLPP', '', '', 'activo', '', 'TES-PD');
select wf.f_insert_ttipo_estado ('en_pago', 'En pago', 'no', 'si', 'no', 'anterior', '', 'anterior', '', '', 'activo', 'TOPD', 'TPLAP');
select wf.f_insert_ttipo_estado ('borrador', 'Borrador', 'si', 'no', 'no', 'anterior', '', 'anterior', '', '', 'activo', 'TOPD', '');
select wf.f_insert_ttipo_estado ('registrado', 'Registrado', 'no', 'si', 'no', 'anterior', '', 'anterior', '', '', 'activo', 'TOPD', '');
select wf.f_insert_ttipo_estado ('finalizado', 'Finalizado', 'no', 'no', 'si', 'anterior', '', 'anterior', '', '', 'activo', 'TOPD', '');
select wf.f_insert_ttipo_estado ('anulado', 'Anulado', 'no', 'no', 'si', 'anterior', '', 'anterior', '', '', 'activo', 'TOPD', '');
select wf.f_insert_ttipo_estado ('borrador', 'borrador', 'si', 'no', 'no', 'anterior', '', 'anterior', '', '', 'activo', 'TPLAP', '');
select wf.f_insert_ttipo_estado ('pendiente', 'pendiente', 'no', 'no', 'no', 'anterior', '', 'anterior', '', '', 'activo', 'TPLAP', '');
select wf.f_insert_ttipo_estado ('devengado', 'devengado', 'no', 'si', 'si', 'anterior', '', 'anterior', '', '', 'activo', 'TPLAP', 'TPLPP');
select wf.f_insert_ttipo_estado ('anulado', 'Anulado', 'no', 'no', 'si', 'anterior', '', 'anterior', '', '', 'activo', 'TPLAP', '');
select wf.f_insert_ttipo_estado ('borrador', 'Borrador', 'si', 'no', 'no', 'anterior', '', 'anterior', '', '', 'activo', 'TPLPP', '');
select wf.f_insert_ttipo_estado ('pendiente', 'Pendiente', 'no', 'no', 'no', 'anterior', '', 'anterior', '', '', 'activo', 'TPLPP', '');
select wf.f_insert_ttipo_estado ('pagado', 'Pagado', 'no', 'no', 'si', 'anterior', '', 'anterior', '', '', 'activo', 'TPLPP', '');
select wf.f_insert_ttipo_estado ('anulado', 'Anulado', 'no', 'no', 'si', 'anterior', '', 'anterior', '', '', 'activo', 'TPLPP', '');
select wf.f_insert_testructura_estado ('borrador', 'TOPD', 'registrado', 'TOPD', '1', '', 'activo');
select wf.f_insert_testructura_estado ('registrado', 'TOPD', 'en_pago', 'TOPD', '1', '', 'activo');
select wf.f_insert_testructura_estado ('en_pago', 'TOPD', 'finalizado', 'TOPD', '1', '', 'activo');
select wf.f_insert_testructura_estado ('borrador', 'TPLAP', 'pendiente', 'TPLAP', '1', '', 'activo');
select wf.f_insert_testructura_estado ('pendiente', 'TPLAP', 'devengado', 'TPLAP', '1', '', 'activo');
select wf.f_insert_testructura_estado ('borrador', 'TPLPP', 'pendiente', 'TPLPP', '1', '', 'activo');
select wf.f_insert_testructura_estado ('pendiente', 'TPLPP', 'pagado', 'TPLPP', '1', '', 'activo');

/********************************************F-DAT-GSS-TES-14-12/04/2013**********************************************/


/***********************************I-DAT-GSS-TES-101-22/04/2013*****************************************/


/***********************************F-DAT-GSS-TES-101-22/04/2013*****************************************/




/***********************************I-DAT-RAC-TES-0-17/07/2014*****************************************/

INSERT INTO pxp.variable_global ("variable", "valor", "descripcion")
VALUES (E'politica_porcentaje_anticipo', E'0.5', E'politica de anticipo parciales, no puede ser mayor al 50%del total a pagar');

/***********************************F-DAT-RAC-TES-0-17/07/2014*****************************************/




/***********************************I-DAT-RAC-TES-0-29/07/2014*****************************************/
INSERT INTO tes.ttipo_plan_pago ("id_usuario_reg", "id_usuario_mod", "fecha_reg", "fecha_mod", "estado_reg", "id_usuario_ai", "usuario_ai", "codigo", "descripcion", "codigo_proceso_llave_wf", "codigo_plantilla_comprobante")
VALUES (1, 1, E'2014-07-15 09:32:41.069', E'2014-07-15 11:09:41.378', E'activo', NULL, E'NULL', E'pagado', E'Solo pagado, previo devengado', E'TPLPP', E'PAGTESPROV');

INSERT INTO tes.ttipo_plan_pago ("id_usuario_reg", "id_usuario_mod", "fecha_reg", "fecha_mod", "estado_reg", "id_usuario_ai", "usuario_ai", "codigo", "descripcion", "codigo_proceso_llave_wf", "codigo_plantilla_comprobante")
VALUES (1, 1, E'2014-07-15 09:30:50.178', E'2014-07-15 11:09:54.761', E'activo', NULL, E'NULL', E'devengado_pagado', E'Devngado y pagado con dos comprobantes', E'TPLAP', E'DEVTESPROV');

INSERT INTO tes.ttipo_plan_pago ("id_usuario_reg", "id_usuario_mod", "fecha_reg", "fecha_mod", "estado_reg", "id_usuario_ai", "usuario_ai", "codigo", "descripcion", "codigo_proceso_llave_wf", "codigo_plantilla_comprobante")
VALUES (1, 1, E'2014-07-15 09:32:02.788', E'2014-07-15 11:10:43.140', E'activo', NULL, E'NULL', E'devengado', E'Solo devengado', E'TPLAP', E'DEVTESPROV');

INSERT INTO tes.ttipo_plan_pago ("id_usuario_reg", "id_usuario_mod", "fecha_reg", "fecha_mod", "estado_reg", "id_usuario_ai", "usuario_ai", "codigo", "descripcion", "codigo_proceso_llave_wf", "codigo_plantilla_comprobante")
VALUES (1, 1, E'2014-07-15 10:06:28.057', E'2014-07-16 16:35:14.024', E'activo', NULL, E'NULL', E'devengado_pagado_1c', E'Devengar y pagar con un solo comprobante', E'TPLAP', E'DEVPAGTESPROV');

INSERT INTO tes.ttipo_plan_pago ("id_usuario_reg", "id_usuario_mod", "fecha_reg", "fecha_mod", "estado_reg", "id_usuario_ai", "usuario_ai", "codigo", "descripcion", "codigo_proceso_llave_wf", "codigo_plantilla_comprobante")
VALUES (1, 1, E'2014-07-17 17:38:26.901', E'2014-07-18 14:48:50.915', E'activo', NULL, E'NULL', E'ant_parcial', E'Anticipo parcial', E'PD_ANT_PAR', E'ANTICIPOPARCIAL');

INSERT INTO tes.ttipo_plan_pago ("id_usuario_reg", "id_usuario_mod", "fecha_reg", "fecha_mod", "estado_reg", "id_usuario_ai", "usuario_ai", "codigo", "descripcion", "codigo_proceso_llave_wf", "codigo_plantilla_comprobante")
VALUES (1, 1, E'2014-07-21 12:15:33.648', E'2014-07-21 15:16:26.797', E'activo', NULL, E'NULL', E'anticipo', E'Anticipo contra factura o recibo', E'PD_ANT_PAR', E'ANTICIPOTOTAL');

INSERT INTO tes.ttipo_plan_pago ("id_usuario_reg", "id_usuario_mod", "fecha_reg", "fecha_mod", "estado_reg", "id_usuario_ai", "usuario_ai", "codigo", "descripcion", "codigo_proceso_llave_wf", "codigo_plantilla_comprobante")
VALUES (1, 1, E'2014-07-22 10:41:13.580', E'2014-07-22 15:41:28.227', E'activo', NULL, E'NULL', E'ant_aplicado', E'Aplicaciond e anticipo', E'PD_AP_ANT', E'APLIC_ANTI');

INSERT INTO tes.ttipo_plan_pago ("id_usuario_reg", "id_usuario_mod", "fecha_reg", "fecha_mod", "estado_reg", "id_usuario_ai", "usuario_ai", "codigo", "descripcion", "codigo_proceso_llave_wf", "codigo_plantilla_comprobante")
VALUES (1, 1, E'2014-07-23 12:23:47.391', E'2014-07-23 14:54:16.327', E'activo', NULL, E'NULL', E'dev_garantia', E'Devolucion de garantia', E'PD_ANT_PAR', E'DEVOLGAR');
/***********************************F-DAT-RAC-TES-0-29/07/2014*****************************************/



/***********************************I-DAT-RAC-TES-0-19/02/2015*****************************************/


SELECT * FROM param.f_inserta_documento('TES', 'PU', 'Pago Único', 'periodo', NULL, 'depto', NULL);

/***********************************F-DAT-RAC-TES-0-19/02/2015*****************************************/




/***********************************I-DAT-RAC-TES-0-22/07/2015*****************************************/

INSERT INTO pxp.variable_global ("variable", "valor", "descripcion")
VALUES (E'tes_prioridad_lb_internacional', E'3', E'configura la prioridad para reconocer la prioridad delibro de bancos internacional\r\n');


/***********************************F-DAT-RAC-TES-0-22/07/2015*****************************************/





/***********************************I-DAT-RAC-TES-0-08/09/2015*****************************************/

/* Data for the 'pxp.variable_global' table  (Records 1 - 6) */

INSERT INTO pxp.variable_global ("variable", "valor", "descripcion")
VALUES (E'tes_tipo_documento_especial', E'PE', E'codigo de documento para pagos especial');

INSERT INTO pxp.variable_global ("variable", "valor", "descripcion")
VALUES (E'tes_codigo_macro_especial', E'TES-PD', E'codigo de proceso macro en WF para pagos especiales');

INSERT INTO pxp.variable_global ("variable", "valor", "descripcion")
VALUES (E'tes_tipo_documento_pago_unico', E'PU', E'codigo de documento para pagos unicos');

INSERT INTO pxp.variable_global ("variable", "valor", "descripcion")
VALUES (E'tes_codigo_macro_pago_unico', E'PU', E'codigo de proceso macro en WF para pagos unicos\r\ncodigo de proceso macro en WF para pagos unicos');

INSERT INTO pxp.variable_global ("variable", "valor", "descripcion")
VALUES (E'tes_tipo_documento_pago_directo', E'PGD', E'codigo de documento para pagos directos');

INSERT INTO pxp.variable_global ("variable", "valor", "descripcion")
VALUES (E'tes_codigo_macro_pago_directo', E'TES-PD', E'codigo de proceso macro en WF para pagos directos');


/***********************************F-DAT-RAC-TES-0-08/09/2015*****************************************/

/***********************************I-DAT-RAC-TES-0-23/11/2015*****************************************/


/* Data for the 'pxp.variable_global' table  (Records 1 - 1) */

INSERT INTO pxp.variable_global ("variable", "valor", "descripcion")
VALUES (E'tes_tipo_pago_deshabilitado', E'', E'codigo de los tipos de pago deshabilitados para la estacion');


/***********************************F-DAT-RAC-TES-0-23/11/2015*****************************************/


/***********************************I-DAT-GSS-TES-0-29/01/2016*****************************************/

SELECT * FROM param.f_inserta_documento('TES', 'CAJA', 'Caja Chica', 'gestion', NULL, 'depto', NULL);
SELECT * FROM param.f_inserta_documento('TES', 'SEFE', 'Solicitud Efectivo', 'gestion', NULL, 'tabla', 'codtabla-coddoc-correlativo-gestion');
SELECT * FROM param.f_inserta_documento('TES', 'REN', 'Rendicion', 'gestion', NULL, 'tabla', 'codtabla-coddoc-correlativo-gestion');

/***********************************F-DAT-GSS-TES-0-29/01/2016*****************************************/



/***********************************I-DAT-RAC-TES-0-4/5/2016*****************************************/



/* Data for the 'pxp.variable_global' table  (Records 1 - 1) */

INSERT INTO pxp.variable_global ("variable", "valor", "descripcion")
VALUES
  (E'pre_verificar_categoria', E'no', E'verificar presupuestaria por categoria, (por defecto no, es verificacion solo presupeusto)');



/***********************************F-DAT-RAC-TES-0-4/5/2016*****************************************/

/***********************************I-DAT-GSS-TES-0-22/06/2016*****************************************/

----------------------------------
--COPY LINES TO SUBSYSTEM data.sql FILE
---------------------------------

select wf.f_import_tproceso_macro ('insert','TES-CAJA', 'TES', 'Caja','si');
select wf.f_import_tcategoria_documento ('insert','legales', 'Legales');
select wf.f_import_tcategoria_documento ('insert','proceso', 'Proceso');
select wf.f_import_ttipo_proceso ('insert','CRE',NULL,NULL,'TES-CAJA','Creacion de Caja','tes.tproceso_caja','id_proceso_caja','si','','','','CRE',NULL);
select wf.f_import_ttipo_proceso ('delete','RENP',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
select wf.f_import_ttipo_proceso ('delete','RENR',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
select wf.f_import_ttipo_estado ('insert','borrador','CRE','Borrador','si','no','no','ninguno','','ninguno','','','si','no',NULL,'<font color="99CC00" size="5"><font size="4">{TIPO_PROCESO}</font></font><br><br><b>&nbsp;</b>Tramite:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; <b>{NUM_TRAMITE}</b><br><b>&nbsp;</b>Usuario :<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {USUARIO_PREVIO} </b>en estado<b>&nbsp; {ESTADO_ANTERIOR}<br></b>&nbsp;<b>Responsable:&nbsp;&nbsp; &nbsp;&nbsp; </b><b>{FUNCIONARIO_PREVIO}&nbsp; {DEPTO_PREVIO}<br>&nbsp;</b>Estado Actual<b>: &nbsp; &nbsp;&nbsp; {ESTADO_ACTUAL}</b><br><br><br>&nbsp;{OBS} <br>','Nuevo tramite {NUM_TRAMITE} en estado "{ESTADO_ACTUAL}"','','no','','','','','','','',NULL);
select wf.f_import_ttipo_estado ('insert','solicitado','CRE','Solicitado','no','no','no','listado','','anterior','','','si','no',NULL,'<font color="99CC00" size="5"><font size="4">{TIPO_PROCESO}</font></font><br><br><b>&nbsp;</b>Tramite:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; <b>{NUM_TRAMITE}</b><br><b>&nbsp;</b>Usuario :<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {USUARIO_PREVIO} </b>en estado<b>&nbsp; {ESTADO_ANTERIOR}<br></b>&nbsp;<b>Responsable:&nbsp;&nbsp; &nbsp;&nbsp; </b><b>{FUNCIONARIO_PREVIO}&nbsp; {DEPTO_PREVIO}<br>&nbsp;</b>Estado Actual<b>: &nbsp; &nbsp;&nbsp; {ESTADO_ACTUAL}</b><br><br><br>&nbsp;{OBS} <br>','Nuevo tramite {NUM_TRAMITE} en estado "{ESTADO_ACTUAL}"','','no','','','','','','','',NULL);
select wf.f_import_ttipo_estado ('insert','aprobado','CRE','Aprobado','no','si','si','ninguno','','ninguno','','','si','no',NULL,'<font color="99CC00" size="5"><font size="4">{TIPO_PROCESO}</font></font><br><br><b>&nbsp;</b>Tramite:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; <b>{NUM_TRAMITE}</b><br><b>&nbsp;</b>Usuario :<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {USUARIO_PREVIO} </b>en estado<b>&nbsp; {ESTADO_ANTERIOR}<br></b>&nbsp;<b>Responsable:&nbsp;&nbsp; &nbsp;&nbsp; </b><b>{FUNCIONARIO_PREVIO}&nbsp; {DEPTO_PREVIO}<br>&nbsp;</b>Estado Actual<b>: &nbsp; &nbsp;&nbsp; {ESTADO_ACTUAL}</b><br><br><br>&nbsp;{OBS} <br>','Nuevo tramite {NUM_TRAMITE} en estado "{ESTADO_ACTUAL}"','','no','','','','','','','',NULL);
select wf.f_import_ttipo_estado ('delete','borrador','RENP',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,
							NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
select wf.f_import_ttipo_estado ('delete','revision','RENP',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,
							NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
select wf.f_import_ttipo_estado ('delete','rendido','RENP',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,
							NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
select wf.f_import_ttipo_estado ('delete','borrador','RENR',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,
							NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
select wf.f_import_ttipo_estado ('delete','revision','RENR',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,
							NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
select wf.f_import_ttipo_estado ('delete','repuesto','RENR',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,
							NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
select wf.f_import_ttipo_estado ('insert','rechazado','CRE','Rechazado','no','no','si','ninguno','','anterior','','','no','no',NULL,'<font color="99CC00" size="5"><font size="4">{TIPO_PROCESO}</font></font><br><br><b>&nbsp;</b>Tramite:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; <b>{NUM_TRAMITE}</b><br><b>&nbsp;</b>Usuario :<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {USUARIO_PREVIO} </b>en estado<b>&nbsp; {ESTADO_ANTERIOR}<br></b>&nbsp;<b>Responsable:&nbsp;&nbsp; &nbsp;&nbsp; </b><b>{FUNCIONARIO_PREVIO}&nbsp; {DEPTO_PREVIO}<br>&nbsp;</b>Estado Actual<b>: &nbsp; &nbsp;&nbsp; {ESTADO_ACTUAL}</b><br><br><br>&nbsp;{OBS} <br>','Nuevo tramite {NUM_TRAMITE} en estado "{ESTADO_ACTUAL}"','','no','','','','','','','',NULL);
select wf.f_import_ttipo_estado ('insert','obligaciones','CRE','Obligaciones','no','si','no','ninguno','','anterior','','','no','no',NULL,'<font color="99CC00" size="5"><font size="4">{TIPO_PROCESO}</font></font><br><br><b>&nbsp;</b>Tramite:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; <b>{NUM_TRAMITE}</b><br><b>&nbsp;</b>Usuario :<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {USUARIO_PREVIO} </b>en estado<b>&nbsp; {ESTADO_ANTERIOR}<br></b>&nbsp;<b>Responsable:&nbsp;&nbsp; &nbsp;&nbsp; </b><b>{FUNCIONARIO_PREVIO}&nbsp; {DEPTO_PREVIO}<br>&nbsp;</b>Estado Actual<b>: &nbsp; &nbsp;&nbsp; {ESTADO_ACTUAL}</b><br><br><br>&nbsp;{OBS} <br>','Nuevo tramite {NUM_TRAMITE} en estado "{ESTADO_ACTUAL}"','','no','','','','','','','',NULL);
select wf.f_import_ttipo_estado ('insert','anulado','CRE','Anulado','no','no','si','anterior','','anterior','','','no','no',NULL,'<font color="99CC00" size="5"><font size="4">{TIPO_PROCESO}</font></font><br><br><b>&nbsp;</b>Tramite:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; <b>{NUM_TRAMITE}</b><br><b>&nbsp;</b>Usuario :<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {USUARIO_PREVIO} </b>en estado<b>&nbsp; {ESTADO_ANTERIOR}<br></b>&nbsp;<b>Responsable:&nbsp;&nbsp; &nbsp;&nbsp; </b><b>{FUNCIONARIO_PREVIO}&nbsp; {DEPTO_PREVIO}<br>&nbsp;</b>Estado Actual<b>: &nbsp; &nbsp;&nbsp; {ESTADO_ACTUAL}</b><br><br><br>&nbsp;{OBS} <br>','Nuevo tramite {NUM_TRAMITE} en estado "{ESTADO_ACTUAL}"','','no','','','','','','','',NULL);
select wf.f_import_ttipo_estado ('delete','pendiente','RENR',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,
							NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
select wf.f_import_ttipo_estado ('delete','rendido','RENR',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,
							NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
select wf.f_import_ttipo_estado ('delete','cbte_respo','RENR',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,
							NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
select wf.f_import_ttipo_estado ('delete','pendiente_repo','RENR',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,
							NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
select wf.f_import_ttipo_estado ('delete','contabilizado','RENR',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,
							NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);


select wf.f_import_testructura_estado ('delete','borrador','solicitado','CRE',NULL,NULL);
select wf.f_import_testructura_estado ('delete','borrador','revision','RENP',NULL,NULL);
select wf.f_import_testructura_estado ('delete','revision','rendido','RENP',NULL,NULL);
select wf.f_import_testructura_estado ('delete','borrador','revision','RENR',NULL,NULL);
select wf.f_import_testructura_estado ('delete','revision','repuesto','RENR',NULL,NULL);
select wf.f_import_testructura_estado ('insert','aprobado','rechazado','CRE',1,'');
select wf.f_import_testructura_estado ('delete','solicitado','obligaciones','CRE',NULL,NULL);
select wf.f_import_testructura_estado ('insert','obligaciones','aprobado','CRE',1,'');
select wf.f_import_testructura_estado ('delete','borrador','rechazado','CRE',NULL,NULL);
select wf.f_import_testructura_estado ('delete','borrador','aprobado','CRE',NULL,NULL);
select wf.f_import_testructura_estado ('insert','borrador','solicitado','CRE',1,'');
select wf.f_import_testructura_estado ('insert','solicitado','aprobado','CRE',1,'');
select wf.f_import_testructura_estado ('insert','solicitado','rechazado','CRE',1,'');
select wf.f_import_testructura_estado ('delete','revision','pendiente','RENR',NULL,NULL);
select wf.f_import_testructura_estado ('delete','pendiente','rendido','RENR',NULL,NULL);
select wf.f_import_testructura_estado ('delete','rendido','pendiente_repo','RENR',NULL,NULL);
select wf.f_import_testructura_estado ('delete','pendiente_repo','contabilizado','RENR',NULL,NULL);


----------------------------------
--COPY LINES TO SUBSYSTEM data.sql FILE
---------------------------------

select wf.f_import_tproceso_macro ('insert','TES-REND', 'TES', 'Proceso Caja','si');
select wf.f_import_tcategoria_documento ('insert','legales', 'Legales');
select wf.f_import_tcategoria_documento ('insert','proceso', 'Proceso');
select wf.f_import_ttipo_proceso ('insert','REN',NULL,NULL,'TES-REND','Rendicion','tes.tproceso_caja','id_proceso_caja','si','','null','','REN',NULL);
select wf.f_import_ttipo_proceso ('insert','CIERRE','rendido','REN','TES-REND','Cierre de Caja','','','no','','opcional','','CIERRE',NULL);
select wf.f_import_ttipo_proceso ('insert','REPO','rendido','REN','TES-REND','Reposición de Caja','tes.tproceso_caja','id_proceso_caja','no','','opcional','','REPO',NULL);
select wf.f_import_ttipo_estado ('insert','borrador','REN','Borrador','si','no','no','ninguno','','ninguno','','','no','no',NULL,'<font color="99CC00" size="5"><font size="4">{TIPO_PROCESO}</font></font><br><br><b>&nbsp;</b>Tramite:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; <b>{NUM_TRAMITE}</b><br><b>&nbsp;</b>Usuario :<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {USUARIO_PREVIO} </b>en estado<b>&nbsp; {ESTADO_ANTERIOR}<br></b>&nbsp;<b>Responsable:&nbsp;&nbsp; &nbsp;&nbsp; </b><b>{FUNCIONARIO_PREVIO}&nbsp; {DEPTO_PREVIO}<br>&nbsp;</b>Estado Actual<b>: &nbsp; &nbsp;&nbsp; {ESTADO_ACTUAL}</b><br><br><br>&nbsp;{OBS} <br>','Nuevo tramite {NUM_TRAMITE} en estado "{ESTADO_ACTUAL}"','','no','','','','','','','',NULL);
select wf.f_import_ttipo_estado ('insert','vbconta','REN','VoBo Conta','no','no','no','segun_depto','','anterior','','','si','si',NULL,'<font color="99CC00" size="5"><font size="4">{TIPO_PROCESO}</font></font><br><br><b>&nbsp;</b>Tramite:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; <b>{NUM_TRAMITE}</b><br><b>&nbsp;</b>Usuario :<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {USUARIO_PREVIO} </b>en estado<b>&nbsp; {ESTADO_ANTERIOR}<br></b>&nbsp;<b>Responsable:&nbsp;&nbsp; &nbsp;&nbsp; </b><b>{FUNCIONARIO_PREVIO}&nbsp; {DEPTO_PREVIO}<br>&nbsp;</b>Estado Actual<b>: &nbsp; &nbsp;&nbsp; {ESTADO_ACTUAL}</b><br><br><br>&nbsp;{OBS} <br>','Nuevo tramite {NUM_TRAMITE} en estado "{ESTADO_ACTUAL}"','','no','','','','','','','',NULL);
select wf.f_import_ttipo_estado ('insert','rendido','REN','Rendido','no','si','si','ninguno','','anterior','','','no','no',NULL,'<font color="99CC00" size="5"><font size="4">{TIPO_PROCESO}</font></font><br><br><b>&nbsp;</b>Tramite:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; <b>{NUM_TRAMITE}</b><br><b>&nbsp;</b>Usuario :<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {USUARIO_PREVIO} </b>en estado<b>&nbsp; {ESTADO_ANTERIOR}<br></b>&nbsp;<b>Responsable:&nbsp;&nbsp; &nbsp;&nbsp; </b><b>{FUNCIONARIO_PREVIO}&nbsp; {DEPTO_PREVIO}<br>&nbsp;</b>Estado Actual<b>: &nbsp; &nbsp;&nbsp; {ESTADO_ACTUAL}</b><br><br><br>&nbsp;{OBS} <br>','Nuevo tramite {NUM_TRAMITE} en estado "{ESTADO_ACTUAL}"','','no','','','','','','','',NULL);
select wf.f_import_ttipo_estado ('insert','pendiente','REN','Pendiente','no','si','no','ninguno','','anterior','','','no','no',NULL,'<font color="99CC00" size="5"><font size="4">{TIPO_PROCESO}</font></font><br><br><b>&nbsp;</b>Tramite:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; <b>{NUM_TRAMITE}</b><br><b>&nbsp;</b>Usuario :<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {USUARIO_PREVIO} </b>en estado<b>&nbsp; {ESTADO_ANTERIOR}<br></b>&nbsp;<b>Responsable:&nbsp;&nbsp; &nbsp;&nbsp; </b><b>{FUNCIONARIO_PREVIO}&nbsp; {DEPTO_PREVIO}<br>&nbsp;</b>Estado Actual<b>: &nbsp; &nbsp;&nbsp; {ESTADO_ACTUAL}</b><br><br><br>&nbsp;{OBS} <br>','Nuevo tramite {NUM_TRAMITE} en estado "{ESTADO_ACTUAL}"','','no','','','','','','','',NULL);
select wf.f_import_ttipo_estado ('insert','borrador','CIERRE','Borrador','si','no','no','anterior','','anterior','','','no','no',NULL,'<font color="99CC00" size="5"><font size="4">{TIPO_PROCESO}</font></font><br><br><b>&nbsp;</b>Tramite:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; <b>{NUM_TRAMITE}</b><br><b>&nbsp;</b>Usuario :<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {USUARIO_PREVIO} </b>en estado<b>&nbsp; {ESTADO_ANTERIOR}<br></b>&nbsp;<b>Responsable:&nbsp;&nbsp; &nbsp;&nbsp; </b><b>{FUNCIONARIO_PREVIO}&nbsp; {DEPTO_PREVIO}<br>&nbsp;</b>Estado Actual<b>: &nbsp; &nbsp;&nbsp; {ESTADO_ACTUAL}</b><br><br><br>&nbsp;{OBS} <br>','Nuevo tramite {NUM_TRAMITE} en estado "{ESTADO_ACTUAL}"','','no','','','','','','','',NULL);
select wf.f_import_ttipo_estado ('insert','pendiente','CIERRE','Pendiente','no','no','no','anterior','','anterior','','','no','no',NULL,'<font color="99CC00" size="5"><font size="4">{TIPO_PROCESO}</font></font><br><br><b>&nbsp;</b>Tramite:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; <b>{NUM_TRAMITE}</b><br><b>&nbsp;</b>Usuario :<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {USUARIO_PREVIO} </b>en estado<b>&nbsp; {ESTADO_ANTERIOR}<br></b>&nbsp;<b>Responsable:&nbsp;&nbsp; &nbsp;&nbsp; </b><b>{FUNCIONARIO_PREVIO}&nbsp; {DEPTO_PREVIO}<br>&nbsp;</b>Estado Actual<b>: &nbsp; &nbsp;&nbsp; {ESTADO_ACTUAL}</b><br><br><br>&nbsp;{OBS} <br>','Nuevo tramite {NUM_TRAMITE} en estado "{ESTADO_ACTUAL}"','','no','','','','','','','',NULL);
select wf.f_import_ttipo_estado ('insert','cerrado','CIERRE','Cerrado','no','no','si','anterior','','anterior','','','no','no',NULL,'<font color="99CC00" size="5"><font size="4">{TIPO_PROCESO}</font></font><br><br><b>&nbsp;</b>Tramite:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; <b>{NUM_TRAMITE}</b><br><b>&nbsp;</b>Usuario :<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {USUARIO_PREVIO} </b>en estado<b>&nbsp; {ESTADO_ANTERIOR}<br></b>&nbsp;<b>Responsable:&nbsp;&nbsp; &nbsp;&nbsp; </b><b>{FUNCIONARIO_PREVIO}&nbsp; {DEPTO_PREVIO}<br>&nbsp;</b>Estado Actual<b>: &nbsp; &nbsp;&nbsp; {ESTADO_ACTUAL}</b><br><br><br>&nbsp;{OBS} <br>','Nuevo tramite {NUM_TRAMITE} en estado "{ESTADO_ACTUAL}"','','no','','','','','','','',NULL);
select wf.f_import_ttipo_estado ('insert','borrador','REPO','Borrador','si','no','no','anterior','','anterior','','','no','no',NULL,'<font color="99CC00" size="5"><font size="4">{TIPO_PROCESO}</font></font><br><br><b>&nbsp;</b>Tramite:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; <b>{NUM_TRAMITE}</b><br><b>&nbsp;</b>Usuario :<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {USUARIO_PREVIO} </b>en estado<b>&nbsp; {ESTADO_ANTERIOR}<br></b>&nbsp;<b>Responsable:&nbsp;&nbsp; &nbsp;&nbsp; </b><b>{FUNCIONARIO_PREVIO}&nbsp; {DEPTO_PREVIO}<br>&nbsp;</b>Estado Actual<b>: &nbsp; &nbsp;&nbsp; {ESTADO_ACTUAL}</b><br><br><br>&nbsp;{OBS} <br>','Nuevo tramite {NUM_TRAMITE} en estado "{ESTADO_ACTUAL}"','','no','','','','','','','',NULL);
select wf.f_import_ttipo_estado ('insert','vbconta','REPO','VoBo contabilidad','no','no','no','segun_depto','','anterior','','','no','no',NULL,'<font color="99CC00" size="5"><font size="4">{TIPO_PROCESO}</font></font><br><br><b>&nbsp;</b>Tramite:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; <b>{NUM_TRAMITE}</b><br><b>&nbsp;</b>Usuario :<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {USUARIO_PREVIO} </b>en estado<b>&nbsp; {ESTADO_ANTERIOR}<br></b>&nbsp;<b>Responsable:&nbsp;&nbsp; &nbsp;&nbsp; </b><b>{FUNCIONARIO_PREVIO}&nbsp; {DEPTO_PREVIO}<br>&nbsp;</b>Estado Actual<b>: &nbsp; &nbsp;&nbsp; {ESTADO_ACTUAL}</b><br><br><br>&nbsp;{OBS} <br>','Nuevo tramite {NUM_TRAMITE} en estado "{ESTADO_ACTUAL}"','','no','','','','','','','',NULL);
select wf.f_import_ttipo_estado ('insert','pendiente','REPO','Pendiente','no','si','no','anterior','','anterior','','','no','no',NULL,'<font color="99CC00" size="5"><font size="4">{TIPO_PROCESO}</font></font><br><br><b>&nbsp;</b>Tramite:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; <b>{NUM_TRAMITE}</b><br><b>&nbsp;</b>Usuario :<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {USUARIO_PREVIO} </b>en estado<b>&nbsp; {ESTADO_ANTERIOR}<br></b>&nbsp;<b>Responsable:&nbsp;&nbsp; &nbsp;&nbsp; </b><b>{FUNCIONARIO_PREVIO}&nbsp; {DEPTO_PREVIO}<br>&nbsp;</b>Estado Actual<b>: &nbsp; &nbsp;&nbsp; {ESTADO_ACTUAL}</b><br><br><br>&nbsp;{OBS} <br>','Nuevo tramite {NUM_TRAMITE} en estado "{ESTADO_ACTUAL}"','','no','','','','','','','',NULL);
select wf.f_import_ttipo_estado ('insert','contabilizado','REPO','Contabilizado','no','si','si','anterior','','anterior','','','no','no',NULL,'<font color="99CC00" size="5"><font size="4">{TIPO_PROCESO}</font></font><br><br><b>&nbsp;</b>Tramite:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; <b>{NUM_TRAMITE}</b><br><b>&nbsp;</b>Usuario :<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {USUARIO_PREVIO} </b>en estado<b>&nbsp; {ESTADO_ANTERIOR}<br></b>&nbsp;<b>Responsable:&nbsp;&nbsp; &nbsp;&nbsp; </b><b>{FUNCIONARIO_PREVIO}&nbsp; {DEPTO_PREVIO}<br>&nbsp;</b>Estado Actual<b>: &nbsp; &nbsp;&nbsp; {ESTADO_ACTUAL}</b><br><br><br>&nbsp;{OBS} <br>','Nuevo tramite {NUM_TRAMITE} en estado "{ESTADO_ACTUAL}"','','no','','','','','','','',NULL);
select wf.f_import_ttipo_estado ('insert','supconta','REN','Sup Contabilidad','no','no','no','ninguno','','depto_func_list','tes.f_lista_depto_conta_x_op_wf_sel','','no','no',NULL,'<font color="99CC00" size="5"><font size="4">{TIPO_PROCESO}</font></font><br><br><b>&nbsp;</b>Tramite:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; <b>{NUM_TRAMITE}</b><br><b>&nbsp;</b>Usuario :<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {USUARIO_PREVIO} </b>en estado<b>&nbsp; {ESTADO_ANTERIOR}<br></b>&nbsp;<b>Responsable:&nbsp;&nbsp; &nbsp;&nbsp; </b><b>{FUNCIONARIO_PREVIO}&nbsp; {DEPTO_PREVIO}<br>&nbsp;</b>Estado Actual<b>: &nbsp; &nbsp;&nbsp; {ESTADO_ACTUAL}</b><br><br><br>&nbsp;{OBS} <br>','Nuevo tramite {NUM_TRAMITE} en estado "{ESTADO_ACTUAL}"','','no','','','','','','','',NULL);
select wf.f_import_ttipo_estado ('insert','supconta','REPO','Sup Contabilidad','no','no','no','ninguno','','depto_func_list','tes.f_lista_depto_conta_x_op_wf_sel','','no','no',NULL,'<font color="99CC00" size="5"><font size="4">{TIPO_PROCESO}</font></font><br><br><b>&nbsp;</b>Tramite:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; <b>{NUM_TRAMITE}</b><br><b>&nbsp;</b>Usuario :<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {USUARIO_PREVIO} </b>en estado<b>&nbsp; {ESTADO_ANTERIOR}<br></b>&nbsp;<b>Responsable:&nbsp;&nbsp; &nbsp;&nbsp; </b><b>{FUNCIONARIO_PREVIO}&nbsp; {DEPTO_PREVIO}<br>&nbsp;</b>Estado Actual<b>: &nbsp; &nbsp;&nbsp; {ESTADO_ACTUAL}</b><br><br><br>&nbsp;{OBS} <br>','Nuevo tramite {NUM_TRAMITE} en estado "{ESTADO_ACTUAL}"','','no','','','','','','','',NULL);
select wf.f_import_ttipo_estado ('insert','vbconta','CIERRE','VoBo contabilidad','no','no','no','listado','','anterior','','','no','si',NULL,'<font color="99CC00" size="5"><font size="4">{TIPO_PROCESO}</font></font><br><br><b>&nbsp;</b>Tramite:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; <b>{NUM_TRAMITE}</b><br><b>&nbsp;</b>Usuario :<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {USUARIO_PREVIO} </b>en estado<b>&nbsp; {ESTADO_ANTERIOR}<br></b>&nbsp;<b>Responsable:&nbsp;&nbsp; &nbsp;&nbsp; </b><b>{FUNCIONARIO_PREVIO}&nbsp; {DEPTO_PREVIO}<br>&nbsp;</b>Estado Actual<b>: &nbsp; &nbsp;&nbsp; {ESTADO_ACTUAL}</b><br><br><br>&nbsp;{OBS} <br>','Nuevo tramite {NUM_TRAMITE} en estado "{ESTADO_ACTUAL}"','','no','','','','','','','',NULL);
select wf.f_import_ttipo_estado ('delete','supconta','REN',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,
							NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
select wf.f_import_ttipo_estado ('insert','supconta','CIERRE','Sup Contabilidad','no','no','no','ninguno','','depto_listado','tes.f_lista_depto_conta_x_op_wf_sel','','no','no',NULL,'<font color="99CC00" size="5"><font size="4">{TIPO_PROCESO}</font></font><br><br><b>&nbsp;</b>Tramite:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; <b>{NUM_TRAMITE}</b><br><b>&nbsp;</b>Usuario :<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {USUARIO_PREVIO} </b>en estado<b>&nbsp; {ESTADO_ANTERIOR}<br></b>&nbsp;<b>Responsable:&nbsp;&nbsp; &nbsp;&nbsp; </b><b>{FUNCIONARIO_PREVIO}&nbsp; {DEPTO_PREVIO}<br>&nbsp;</b>Estado Actual<b>: &nbsp; &nbsp;&nbsp; {ESTADO_ACTUAL}</b><br><br><br>&nbsp;{OBS} <br>','Nuevo tramite {NUM_TRAMITE} en estado "{ESTADO_ACTUAL}"','','no','','','','','','','',NULL);
select wf.f_import_ttipo_estado ('delete','vbfondos','REN',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,
							NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
select wf.f_import_ttipo_estado ('insert','vbfondos','REPO','VoBo Asignacion Fondos','no','no','no','listado','','depto_func_list','tes.f_lista_depto_conta_x_op_wf_sel','','no','no',NULL,'<font color="99CC00" size="5"><font size="4">{TIPO_PROCESO}</font></font><br><br><b>&nbsp;</b>Tramite:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; <b>{NUM_TRAMITE}</b><br><b>&nbsp;</b>Usuario :<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {USUARIO_PREVIO} </b>en estado<b>&nbsp; {ESTADO_ANTERIOR}<br></b>&nbsp;<b>Responsable:&nbsp;&nbsp; &nbsp;&nbsp; </b><b>{FUNCIONARIO_PREVIO}&nbsp; {DEPTO_PREVIO}<br>&nbsp;</b>Estado Actual<b>: &nbsp; &nbsp;&nbsp; {ESTADO_ACTUAL}</b><br><br><br>&nbsp;{OBS} <br>','Aviso WF ,  {PROCESO_MACRO}  ({NUM_TRAMITE})','','no','','','','','','','',NULL);
select wf.f_import_ttipo_estado ('insert','vbpresup','REN','VoBo Presupuestos','no','no','no','listado','','ninguno','','','no','no',NULL,'<font color="99CC00" size="5"><font size="4">{TIPO_PROCESO}</font></font><br><br><b>&nbsp;</b>Tramite:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; <b>{NUM_TRAMITE}</b><br><b>&nbsp;</b>Usuario :<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {USUARIO_PREVIO} </b>en estado<b>&nbsp; {ESTADO_ANTERIOR}<br></b>&nbsp;<b>Responsable:&nbsp;&nbsp; &nbsp;&nbsp; </b><b>{FUNCIONARIO_PREVIO}&nbsp; {DEPTO_PREVIO}<br>&nbsp;</b>Estado Actual<b>: &nbsp; &nbsp;&nbsp; {ESTADO_ACTUAL}</b><br><br><br>&nbsp;{OBS} <br>','Aviso WF ,  {PROCESO_MACRO}  ({NUM_TRAMITE})','','no','','','','','','','',NULL);
select wf.f_import_testructura_estado ('delete','borrador','vbconta','REN',NULL,NULL);
select wf.f_import_testructura_estado ('delete','vbconta','rendido','REN',NULL,NULL);
select wf.f_import_testructura_estado ('insert','vbconta','pendiente','REN',1,'');
select wf.f_import_testructura_estado ('insert','pendiente','rendido','REN',1,'');
select wf.f_import_testructura_estado ('delete','borrador','pendiente','CIERRE',NULL,NULL);
select wf.f_import_testructura_estado ('insert','pendiente','cerrado','CIERRE',1,'');
select wf.f_import_testructura_estado ('delete','borrador','vbconta','REPO',NULL,NULL);
select wf.f_import_testructura_estado ('insert','vbconta','pendiente','REPO',1,'');
select wf.f_import_testructura_estado ('insert','pendiente','contabilizado','REPO',1,'');
select wf.f_import_testructura_estado ('delete','borrador','supconta','REN',NULL,NULL);
select wf.f_import_testructura_estado ('insert','supconta','vbconta','REN',1,'');
select wf.f_import_testructura_estado ('insert','borrador','supconta','REPO',1,'tes.f_regla_tiene_fecha_inicio');
select wf.f_import_testructura_estado ('insert','supconta','vbconta','REPO',1,'');
select wf.f_import_testructura_estado ('insert','borrador','supconta','CIERRE',1,'');
select wf.f_import_testructura_estado ('insert','supconta','vbconta','CIERRE',1,'');
select wf.f_import_testructura_estado ('insert','vbconta','pendiente','CIERRE',1,'');
select wf.f_import_testructura_estado ('delete','vbfondos','pendiente','REN',NULL,NULL);
select wf.f_import_testructura_estado ('delete','borrador','vbfondos','REN',NULL,NULL);
select wf.f_import_testructura_estado ('insert','borrador','vbfondos','REPO',1,'NOT! tes.f_regla_tiene_fecha_inicio');
select wf.f_import_testructura_estado ('insert','vbfondos','pendiente','REPO',1,'');
select wf.f_import_testructura_estado ('insert','borrador','vbpresup','REN',1,'');
select wf.f_import_testructura_estado ('insert','vbpresup','supconta','REN',1,'');

----------------------------------
--COPY LINES TO SUBSYSTEM data.sql FILE
---------------------------------

select wf.f_import_tproceso_macro ('insert','FR', 'TES', 'Fondo Rotativo','si');
select wf.f_import_tcategoria_documento ('insert','legales', 'Legales');
select wf.f_import_tcategoria_documento ('insert','proceso', 'Proceso');
select wf.f_import_ttipo_proceso ('insert','SOLEFE',NULL,NULL,'FR','Solicitud de Efectivo','tes.tsolicitud_efectivo','id_solicitud_efectivo','si','','','','SOLICITUD EFECTIVO',NULL);
select wf.f_import_ttipo_proceso ('insert','EFEREND',NULL,NULL,'FR','Rendicion Efectivo','tes.vsolicitud_efectivo','id_solicitud_efectivo','no','','opcional','','RENDICION EFECTIVO',NULL);
select wf.f_import_ttipo_proceso ('insert','DEVEFE',NULL,NULL,'FR','Devolucion Efectivo','','','no','','opcional','','DEVOLUCION EFECTIVO',NULL);
select wf.f_import_ttipo_proceso ('insert','REPEFE',NULL,NULL,'FR','Reposicion Efectivo','','','no','','opcional','','REPOSICION EFECTIVO',NULL);
select wf.f_import_ttipo_proceso ('insert','INGEFE',NULL,NULL,'FR','Ingreso Efectivo','','','no','','','','INGRESO EFECTIVO',NULL);
select wf.f_import_ttipo_proceso ('insert','SALEFE',NULL,NULL,'FR','Salida Efectivo','','','no','','','','SALIDA EFECTIVO',NULL);
select wf.f_import_ttipo_proceso ('insert','APECAJ',NULL,NULL,'FR','Apertura Caja','','','no','','','','APERTURA CAJA',NULL);
select wf.f_import_ttipo_estado ('insert','borrador','SOLEFE','Borrador','si','no','no','ninguno','','ninguno','','','si','no',NULL,'<font color="99CC00" size="5"><font size="4">{TIPO_PROCESO}</font></font><br><br><b>&nbsp;</b>Tramite:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; <b>{NUM_TRAMITE}</b><br><b>&nbsp;</b>Usuario :<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {USUARIO_PREVIO} </b>en estado<b>&nbsp; {ESTADO_ANTERIOR}<br></b>&nbsp;<b>Responsable:&nbsp;&nbsp; &nbsp;&nbsp; </b><b>{FUNCIONARIO_PREVIO}&nbsp; {DEPTO_PREVIO}<br>&nbsp;</b>Estado Actual<b>: &nbsp; &nbsp;&nbsp; {ESTADO_ACTUAL}</b><br><br><br>&nbsp;{OBS} <br>','Nuevo tramite {NUM_TRAMITE} en estado "{ESTADO_ACTUAL}"','','no','','','','','','','',NULL);
select wf.f_import_ttipo_estado ('insert','vbcajero','SOLEFE','VoboCajero','no','no','no','funcion_listado','tes.f_lista_funcionario_cajero_caja_chica_wf_sel','ninguno','','','si','si',NULL,'<font color="99CC00" size="5"><font size="4">{TIPO_PROCESO}</font></font><br><br><b>&nbsp;</b>Tramite:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; <b>{NUM_TRAMITE}</b><br><b>&nbsp;</b>Usuario :<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {USUARIO_PREVIO} </b>en estado<b>&nbsp; {ESTADO_ANTERIOR}<br></b>&nbsp;<b>Responsable:&nbsp;&nbsp; &nbsp;&nbsp; </b><b>{FUNCIONARIO_PREVIO}&nbsp; {DEPTO_PREVIO}<br>&nbsp;</b>Estado Actual<b>: &nbsp; &nbsp;&nbsp; {ESTADO_ACTUAL}</b><br><br><br>&nbsp;{OBS} <br>','Nuevo tramite {NUM_TRAMITE} en estado "{ESTADO_ACTUAL}"','','no','','','','','','','',NULL);
select wf.f_import_ttipo_estado ('insert','entregado','SOLEFE','Entregado','no','si','no','ninguno','','ninguno','','','si','no',NULL,'<font color="99CC00" size="5"><font size="4">{TIPO_PROCESO}</font></font><br><br><b>&nbsp;</b>Tramite:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; <b>{NUM_TRAMITE}</b><br><b>&nbsp;</b>Usuario :<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {USUARIO_PREVIO} </b>en estado<b>&nbsp; {ESTADO_ANTERIOR}<br></b>&nbsp;<b>Responsable:&nbsp;&nbsp; &nbsp;&nbsp; </b><b>{FUNCIONARIO_PREVIO}&nbsp; {DEPTO_PREVIO}<br>&nbsp;</b>Estado Actual<b>: &nbsp; &nbsp;&nbsp; {ESTADO_ACTUAL}</b><br><br><br>&nbsp;{OBS} <br>','Nuevo tramite {NUM_TRAMITE} en estado "{ESTADO_ACTUAL}"','','no','','','','','','','',NULL);
select wf.f_import_ttipo_estado ('insert','anulado','SOLEFE','Anulado','no','no','si','anterior','','anterior','','','no','no',NULL,'<font color="99CC00" size="5"><font size="4">{TIPO_PROCESO}</font></font><br><br><b>&nbsp;</b>Tramite:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; <b>{NUM_TRAMITE}</b><br><b>&nbsp;</b>Usuario :<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {USUARIO_PREVIO} </b>en estado<b>&nbsp; {ESTADO_ANTERIOR}<br></b>&nbsp;<b>Responsable:&nbsp;&nbsp; &nbsp;&nbsp; </b><b>{FUNCIONARIO_PREVIO}&nbsp; {DEPTO_PREVIO}<br>&nbsp;</b>Estado Actual<b>: &nbsp; &nbsp;&nbsp; {ESTADO_ACTUAL}</b><br><br><br>&nbsp;{OBS} <br>','Nuevo tramite {NUM_TRAMITE} en estado "{ESTADO_ACTUAL}"','','no','','','','','','','',NULL);
select wf.f_import_ttipo_estado ('insert','borrador','EFEREND','Borrador','si','no','no','ninguno','','ninguno','','','no','no',NULL,'<font color="99CC00" size="5"><font size="4">{TIPO_PROCESO}</font></font><br><br><b>&nbsp;</b>Tramite:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; <b>{NUM_TRAMITE}</b><br><b>&nbsp;</b>Usuario :<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {USUARIO_PREVIO} </b>en estado<b>&nbsp; {ESTADO_ANTERIOR}<br></b>&nbsp;<b>Responsable:&nbsp;&nbsp; &nbsp;&nbsp; </b><b>{FUNCIONARIO_PREVIO}&nbsp; {DEPTO_PREVIO}<br>&nbsp;</b>Estado Actual<b>: &nbsp; &nbsp;&nbsp; {ESTADO_ACTUAL}</b><br><br><br>&nbsp;{OBS} <br>','Nuevo tramite {NUM_TRAMITE} en estado "{ESTADO_ACTUAL}"','','no','','','','','','','',NULL);
select wf.f_import_ttipo_estado ('insert','revision','EFEREND','Revision','no','no','no','anterior','','ninguno','','','no','no',NULL,'<font color="99CC00" size="5"><font size="4">{TIPO_PROCESO}</font></font><br><br><b>&nbsp;</b>Tramite:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; <b>{NUM_TRAMITE}</b><br><b>&nbsp;</b>Usuario :<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {USUARIO_PREVIO} </b>en estado<b>&nbsp; {ESTADO_ANTERIOR}<br></b>&nbsp;<b>Responsable:&nbsp;&nbsp; &nbsp;&nbsp; </b><b>{FUNCIONARIO_PREVIO}&nbsp; {DEPTO_PREVIO}<br>&nbsp;</b>Estado Actual<b>: &nbsp; &nbsp;&nbsp; {ESTADO_ACTUAL}</b><br><br><br>&nbsp;{OBS} <br>','Nuevo tramite {NUM_TRAMITE} en estado "{ESTADO_ACTUAL}"','','no','','','','','','','',NULL);
select wf.f_import_ttipo_estado ('delete','devolucion','EFEREND',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,
							NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
select wf.f_import_ttipo_estado ('delete','reposicion','EFEREND',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,
							NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
select wf.f_import_ttipo_estado ('insert','rendido','EFEREND','Rendido','no','no','si','ninguno','','ninguno','','','no','no',NULL,'<font color="99CC00" size="5"><font size="4">{TIPO_PROCESO}</font></font><br><br><b>&nbsp;</b>Tramite:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; <b>{NUM_TRAMITE}</b><br><b>&nbsp;</b>Usuario :<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {USUARIO_PREVIO} </b>en estado<b>&nbsp; {ESTADO_ANTERIOR}<br></b>&nbsp;<b>Responsable:&nbsp;&nbsp; &nbsp;&nbsp; </b><b>{FUNCIONARIO_PREVIO}&nbsp; {DEPTO_PREVIO}<br>&nbsp;</b>Estado Actual<b>: &nbsp; &nbsp;&nbsp; {ESTADO_ACTUAL}</b><br><br><br>&nbsp;{OBS} <br>','Nuevo tramite {NUM_TRAMITE} en estado "{ESTADO_ACTUAL}"','','no','','','','','','','',NULL);
select wf.f_import_ttipo_estado ('delete','borrador','DEVEFE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,
							NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
select wf.f_import_ttipo_estado ('delete','vbcajero','DEVEFE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,
							NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
select wf.f_import_ttipo_estado ('insert','devuelto','DEVEFE','Devuelto','si','no','si','ninguno','','ninguno','','','no','no',NULL,'<font color="99CC00" size="5"><font size="4">{TIPO_PROCESO}</font></font><br><br><b>&nbsp;</b>Tramite:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; <b>{NUM_TRAMITE}</b><br><b>&nbsp;</b>Usuario :<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {USUARIO_PREVIO} </b>en estado<b>&nbsp; {ESTADO_ANTERIOR}<br></b>&nbsp;<b>Responsable:&nbsp;&nbsp; &nbsp;&nbsp; </b><b>{FUNCIONARIO_PREVIO}&nbsp; {DEPTO_PREVIO}<br>&nbsp;</b>Estado Actual<b>: &nbsp; &nbsp;&nbsp; {ESTADO_ACTUAL}</b><br><br><br>&nbsp;{OBS} <br>','Nuevo tramite {NUM_TRAMITE} en estado "{ESTADO_ACTUAL}"','','no','','','','','','','',NULL);
select wf.f_import_ttipo_estado ('delete','borrador','REPEFE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,
							NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
select wf.f_import_ttipo_estado ('delete','vbcajero','REPEFE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,
							NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
select wf.f_import_ttipo_estado ('insert','repuesto','REPEFE','Repuesto','si','no','si','ninguno','','ninguno','','','no','no',NULL,'<font color="99CC00" size="5"><font size="4">{TIPO_PROCESO}</font></font><br><br><b>&nbsp;</b>Tramite:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; <b>{NUM_TRAMITE}</b><br><b>&nbsp;</b>Usuario :<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {USUARIO_PREVIO} </b>en estado<b>&nbsp; {ESTADO_ANTERIOR}<br></b>&nbsp;<b>Responsable:&nbsp;&nbsp; &nbsp;&nbsp; </b><b>{FUNCIONARIO_PREVIO}&nbsp; {DEPTO_PREVIO}<br>&nbsp;</b>Estado Actual<b>: &nbsp; &nbsp;&nbsp; {ESTADO_ACTUAL}</b><br><br><br>&nbsp;{OBS} <br>','Nuevo tramite {NUM_TRAMITE} en estado "{ESTADO_ACTUAL}"','','no','','','','','','','',NULL);
select wf.f_import_ttipo_estado ('insert','anulado','EFEREND','Anulado','no','no','si','anterior','','anterior','','','no','no',NULL,'<font color="99CC00" size="5"><font size="4">{TIPO_PROCESO}</font></font><br><br><b>&nbsp;</b>Tramite:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; <b>{NUM_TRAMITE}</b><br><b>&nbsp;</b>Usuario :<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {USUARIO_PREVIO} </b>en estado<b>&nbsp; {ESTADO_ANTERIOR}<br></b>&nbsp;<b>Responsable:&nbsp;&nbsp; &nbsp;&nbsp; </b><b>{FUNCIONARIO_PREVIO}&nbsp; {DEPTO_PREVIO}<br>&nbsp;</b>Estado Actual<b>: &nbsp; &nbsp;&nbsp; {ESTADO_ACTUAL}</b><br><br><br>&nbsp;{OBS} <br>','Nuevo tramite {NUM_TRAMITE} en estado "{ESTADO_ACTUAL}"','','no','','','','','','','',NULL);
select wf.f_import_ttipo_estado ('insert','finalizado','SOLEFE','Finalizado','no','si','si','ninguno','','ninguno','','','no','no',NULL,'<font color="99CC00" size="5"><font size="4">{TIPO_PROCESO}</font></font><br><br><b>&nbsp;</b>Tramite:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; <b>{NUM_TRAMITE}</b><br><b>&nbsp;</b>Usuario :<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {USUARIO_PREVIO} </b>en estado<b>&nbsp; {ESTADO_ANTERIOR}<br></b>&nbsp;<b>Responsable:&nbsp;&nbsp; &nbsp;&nbsp; </b><b>{FUNCIONARIO_PREVIO}&nbsp; {DEPTO_PREVIO}<br>&nbsp;</b>Estado Actual<b>: &nbsp; &nbsp;&nbsp; {ESTADO_ACTUAL}</b><br><br><br>&nbsp;{OBS} <br>','Nuevo tramite {NUM_TRAMITE} en estado "{ESTADO_ACTUAL}"','','no','','','','','','','',NULL);
select wf.f_import_ttipo_estado ('insert','ingresado','INGEFE','Ingresado','si','no','si','ninguno','','ninguno','','','no','no',NULL,'<font color="99CC00" size="5"><font size="4">{TIPO_PROCESO}</font></font><br><br><b>&nbsp;</b>Tramite:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; <b>{NUM_TRAMITE}</b><br><b>&nbsp;</b>Usuario :<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {USUARIO_PREVIO} </b>en estado<b>&nbsp; {ESTADO_ANTERIOR}<br></b>&nbsp;<b>Responsable:&nbsp;&nbsp; &nbsp;&nbsp; </b><b>{FUNCIONARIO_PREVIO}&nbsp; {DEPTO_PREVIO}<br>&nbsp;</b>Estado Actual<b>: &nbsp; &nbsp;&nbsp; {ESTADO_ACTUAL}</b><br><br><br>&nbsp;{OBS} <br>','Nuevo tramite {NUM_TRAMITE} en estado "{ESTADO_ACTUAL}"','','no','','','','','','','',NULL);
select wf.f_import_ttipo_estado ('insert','salida','SALEFE','Salida','si','no','si','ninguno','','ninguno','','','no','no',NULL,'<font color="99CC00" size="5"><font size="4">{TIPO_PROCESO}</font></font><br><br><b>&nbsp;</b>Tramite:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; <b>{NUM_TRAMITE}</b><br><b>&nbsp;</b>Usuario :<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {USUARIO_PREVIO} </b>en estado<b>&nbsp; {ESTADO_ANTERIOR}<br></b>&nbsp;<b>Responsable:&nbsp;&nbsp; &nbsp;&nbsp; </b><b>{FUNCIONARIO_PREVIO}&nbsp; {DEPTO_PREVIO}<br>&nbsp;</b>Estado Actual<b>: &nbsp; &nbsp;&nbsp; {ESTADO_ACTUAL}</b><br><br><br>&nbsp;{OBS} <br>','Nuevo tramite {NUM_TRAMITE} en estado "{ESTADO_ACTUAL}"','','no','','','','','','','',NULL);
select wf.f_import_ttipo_estado ('insert','aperturado','APECAJ','Aperturado','si','no','si','ninguno','','ninguno','','','no','no',NULL,'<font color="99CC00" size="5"><font size="4">{TIPO_PROCESO}</font></font><br><br><b>&nbsp;</b>Tramite:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; <b>{NUM_TRAMITE}</b><br><b>&nbsp;</b>Usuario :<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {USUARIO_PREVIO} </b>en estado<b>&nbsp; {ESTADO_ANTERIOR}<br></b>&nbsp;<b>Responsable:&nbsp;&nbsp; &nbsp;&nbsp; </b><b>{FUNCIONARIO_PREVIO}&nbsp; {DEPTO_PREVIO}<br>&nbsp;</b>Estado Actual<b>: &nbsp; &nbsp;&nbsp; {ESTADO_ACTUAL}</b><br><br><br>&nbsp;{OBS} <br>','Nuevo tramite {NUM_TRAMITE} en estado "{ESTADO_ACTUAL}"','','no','','','','','','','',NULL);
select wf.f_import_ttipo_estado ('insert','vbjefe','SOLEFE','VoBo Jefe Superior','no','no','no','funcion_listado','tes.f_lista_funcionario_jefe_superior_wf_sel','ninguno','','','no','no',NULL,'<font color="99CC00" size="5"><font size="4">{TIPO_PROCESO}</font></font><br><br><b>&nbsp;</b>Tramite:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; <b>{NUM_TRAMITE}</b><br><b>&nbsp;</b>Usuario :<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {USUARIO_PREVIO} </b>en estado<b>&nbsp; {ESTADO_ANTERIOR}<br></b>&nbsp;<b>Responsable:&nbsp;&nbsp; &nbsp;&nbsp; </b><b>{FUNCIONARIO_PREVIO}&nbsp; {DEPTO_PREVIO}<br>&nbsp;</b>Estado Actual<b>: &nbsp; &nbsp;&nbsp; {ESTADO_ACTUAL}</b><br><br><br>&nbsp;{OBS} <br>','Aviso WF ,  {PROCESO_MACRO}  ({NUM_TRAMITE})','','no','','','','','','','',NULL);
select wf.f_import_ttipo_estado ('insert','vbjefedevsol','EFEREND','Visto Bueno Jefe Devolucion Solicitante','no','no','no','funcion_listado','tes.f_lista_funcionario_jefe_efectivo_wf_sel','ninguno','','','no','no',NULL,'<font color="99CC00" size="5"><font size="4">{TIPO_PROCESO}</font></font><br><br><b>&nbsp;</b>Tramite:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; <b>{NUM_TRAMITE}</b><br><b>&nbsp;</b>Usuario :<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {USUARIO_PREVIO} </b>en estado<b>&nbsp; {ESTADO_ANTERIOR}<br></b>&nbsp;<b>Responsable:&nbsp;&nbsp; &nbsp;&nbsp; </b><b>{FUNCIONARIO_PREVIO}&nbsp; {DEPTO_PREVIO}<br>&nbsp;</b>Estado Actual<b>: &nbsp; &nbsp;&nbsp; {ESTADO_ACTUAL}</b><br><br><br>&nbsp;{OBS} <br>','Aviso WF ,  {PROCESO_MACRO}  ({NUM_TRAMITE})','','no','','','','','','','',NULL);
select wf.f_import_ttipo_documento ('delete','MEMOCAJA','SOLEFE',NULL,NULL,NULL,NULL,NULL,NULL);
select wf.f_import_ttipo_documento ('insert','SOLEFE','SOLEFE','Solicitud de Efectivo','Solicitud de Efectivo','sis_tesoreria/control/SolicitudEfectivo/reporteSolicitudEfectivo','generado',1.00,'{proceso}');
select wf.f_import_ttipo_documento ('insert','ENTEFE','SOLEFE','Recibo Entrega Efectivo','Recibo Entrega Efectivo','sis_tesoreria/control/SolicitudEfectivo/reporteReciboEntrega','generado',1.00,'{proceso}');
select wf.f_import_ttipo_documento ('delete','RENEFE','EFEREND',NULL,NULL,NULL,NULL,NULL,NULL);
select wf.f_import_ttipo_documento ('insert','RENEFE','SOLEFE','Reporte Rendicion de Efectivo','Reporte Rendicion de Efectivo','sis_tesoreria/control/SolicitudEfectivo/reporteRendicionEfectivo','generado',1.00,'{proceso}');
select wf.f_import_testructura_estado ('delete','borrador','vbcajero','SOLEFE',NULL,NULL);
select wf.f_import_testructura_estado ('insert','vbcajero','entregado','SOLEFE',1,'');
select wf.f_import_testructura_estado ('insert','borrador','revision','EFEREND',1,'');
select wf.f_import_testructura_estado ('delete','revision','devolucion','EFEREND',NULL,NULL);
select wf.f_import_testructura_estado ('delete','revision','reposicion','EFEREND',NULL,NULL);
select wf.f_import_testructura_estado ('insert','revision','rendido','EFEREND',1,'');
select wf.f_import_testructura_estado ('delete','devolucion','rendido','EFEREND',NULL,NULL);
select wf.f_import_testructura_estado ('delete','reposicion','rendido','EFEREND',NULL,NULL);
select wf.f_import_testructura_estado ('delete','borrador','vbcajero','DEVEFE',NULL,NULL);
select wf.f_import_testructura_estado ('delete','vbcajero','devuelto','DEVEFE',NULL,NULL);
select wf.f_import_testructura_estado ('delete','borrador','vbcajero','REPEFE',NULL,NULL);
select wf.f_import_testructura_estado ('delete','vbcajero','repuesto','REPEFE',NULL,NULL);
select wf.f_import_testructura_estado ('insert','entregado','finalizado','SOLEFE',1,'');
select wf.f_import_testructura_estado ('insert','vbjefe','vbcajero','SOLEFE',1,'');
select wf.f_import_testructura_estado ('insert','borrador','vbjefe','SOLEFE',1,'');
select wf.f_import_testructura_estado ('insert','vbjefedevsol','rendido','EFEREND',1,'');
select wf.f_import_testructura_estado ('insert','revision','vbjefedevsol','EFEREND',1,'');


select wf.f_import_ttipo_documento_estado ('delete','ENTEFE','SOLEFE','borrador','SOLEFE',NULL,NULL,NULL);
select wf.f_import_ttipo_documento_estado ('insert','ENTEFE','SOLEFE','entregado','SOLEFE','crear','superior','');
select wf.f_import_ttipo_documento_estado ('insert','SOLEFE','SOLEFE','borrador','SOLEFE','crear','superior','');





/***********************************F-DAT-GSS-TES-0-22/06/2016*****************************************/

/***********************************I-DAT-GSS-TES-0-30/06/2016*****************************************/

select param.f_import_tdocumento ('insert','REP','Reposicion Caja','TES','tabla','gestion','','codtabla-coddoc-correlativo-gestion');
select param.f_import_tdocumento ('insert','REN','Rendicion Caja','TES','tabla','gestion','','codtabla-coddoc-correlativo-gestion');
select param.f_import_tdocumento ('insert','CIER','Cierre Caja','TES','tabla','gestion','','codtabla-coddoc-correlativo-gestion');
select param.f_import_tdocumento ('insert','MEMO','Memorandum de Asginacion de Fondos','TES','depto','gestion','','OB.AA.depto.ME correlativo.gestion');
select param.f_import_tdocumento ('insert','SOLEFE','Solicitud Efectivo','TES','tabla','gestion',NULL,'codtabla-coddoc-correlativo-gestion');

/***********************************F-DAT-GSS-TES-0-30/06/2016*****************************************/


/***********************************I-DAT-RAC-TES-0-20/02/2017*****************************************/

INSERT INTO pxp.variable_global ("variable", "valor", "descripcion")
VALUES
  (E'tes_integrar_lb_pagado', E'no', E'por defecto no, al validar un pago inserta un cheque, si o no');


 /***********************************F-DAT-RAC-TES-0-20/02/2017*****************************************/



/***********************************I-DAT-RAC-TES-0-17/08/2017*****************************************/

INSERT INTO pxp.variable_global ("variable", "valor", "descripcion")
VALUES
  (E'tes_gen_cheque_depto_conta_lb_pri_cero', E'no', E'si o no, generar cheque cuando libro de bancos y ldepto de conta tengan prioridad cero');


/***********************************F-DAT-RAC-TES-0-17/08/2017*****************************************/



/***********************************I-DAT-RAC-TES-31-07/11/2017*****************************************/


INSERT INTO pxp.variable_global ("variable", "valor", "descripcion")VALUES
  (E'tes_anticipo_ejecuta_pres', E'no', E'si o no, anticipos ejecutan presupeusto, mismo sin ejecucion contable');


/***********************************F-DAT-RAC-TES-31-07/11/2017*****************************************/



/***********************************I-DAT-RAC-TES-7890-19/11/2017*****************************************/

select wf.f_import_ttipo_proceso_origen ('insert','CON','LEGAL','TOPD','finalizado','manual','');
select wf.f_import_ttipo_proceso_origen ('insert','TOPD','TES-PD','CON','finalizado','manual','');
select wf.f_import_ttipo_proceso_origen ('insert','TOPD','TES-PD','TOPD','finalizado','manual','');


/***********************************F-DAT-RAC-TES-7890-19/11/2017*****************************************/

/***********************************I-DAT-JJA-TES-0-05/12/2018*****************************************/
select pxp.f_insert_tgui ('Consulta OP por plan de pagos', 'Consulta OP  por plan de pagos', 'CONPLAPAG', 'si', 1, 'sis_tesoreria/reportes/formularios/ConsultaOpPlanPago.php', 3, '', 'ConsultaOpPlanPago', 'TES');
/***********************************F-DAT-JJA-TES-0-05/12/2018*****************************************/


/***********************************I-DAT-RCM-TES-0-26/09/2019*****************************************/
--- proceso_macro
insert into wf.tproceso_macro (id_usuario_reg,estado_reg,id_proceso_macro,id_subsistema,codigo,nombre,inicio,modificado,grupo_doc) values (1,'activo',	35,9,'LIB-BAN','Libro Bancos','si',null,'"[{name:""proceso"",title:""<H1 align=center><i class=\""fa fa-thumbs-o-down\""></i> del Proceso</h1>"",grupo:0,height:0}, {name:""legales"",title:""<H1 align=center><i class=\""fa fa-eye\""></i> Legales</h1>"",grupo:1,height:0}]"');

--- tipo_proceso
insert into wf.ttipo_proceso (id_usuario_reg,id_tipo_proceso,id_proceso_macro, nombre,tabla,columna_llave,codigo,inicio, tipo_disparo,codigo_llave, modificado) values (1,72,35,'Cheque - Transferencia - Debito','tes.tts_libro_bancos','id_libro_bancos','LBCHQ','si','obligatorio','cheque',1);
insert into wf.ttipo_proceso (id_usuario_reg,id_tipo_proceso,id_proceso_macro, nombre,tabla,columna_llave,codigo,inicio, tipo_disparo,codigo_llave, modificado) values (1,73,35,'Deposito','tes.tts_libro_bancos','id_libro_bancos','LBDEP','no','obligatorio','deposito',1);
insert into wf.ttipo_proceso (id_usuario_reg,id_tipo_proceso,id_proceso_macro, nombre,tabla,columna_llave,codigo,inicio, tipo_disparo,codigo_llave, modificado) values (1,74,35,'Debito Automatico','tes.tts_libro_bancos','id_libro_bancos','LBDEBT','no','obligatorio','debito_automatico',1);
insert into wf.ttipo_proceso (id_usuario_reg,id_tipo_proceso,id_proceso_macro, nombre,tabla,columna_llave,codigo,inicio, tipo_disparo,codigo_llave, modificado) values (1,75,35,'Transferencia con carta','tes.tts_libro_bancos','id_libro_bancos','LBTRANS','no','obligatorio','transferencia_carta',1);
insert into wf.ttipo_proceso (id_usuario_reg,id_tipo_proceso,id_proceso_macro, nombre,tabla,columna_llave,codigo,inicio, tipo_disparo,codigo_llave, modificado) values (1,76,35,'Transferencia al exterior','','','LIBTRAEX','','','transferencia_exterior',1);
insert into wf.ttipo_proceso (id_usuario_reg,id_tipo_proceso,id_proceso_macro, nombre,tabla,columna_llave,codigo,inicio, tipo_disparo,codigo_llave, modificado) values (1,77,35,'Transferencia interna','tes.tts_libro_bancos','id_libro_bancos','LIBTRAIN','no','obligatorio','transferencia_intern',1);
insert into wf.ttipo_proceso (id_usuario_reg,id_tipo_proceso,id_proceso_macro, nombre,tabla,columna_llave,codigo,inicio, tipo_disparo,codigo_llave, modificado) values (1,78,35,'Transferencia interna debe','tes.tts_libro_bancos','id_libro_bancos','LBTRINDB','no','obligatorio','transf_interna_debe',1);
insert into wf.ttipo_proceso (id_usuario_reg,id_tipo_proceso,id_proceso_macro, nombre,tabla,columna_llave,codigo,inicio, tipo_disparo,codigo_llave, modificado) values (1,79,35,'Transferencia interna haber','tes.tts_libro_bancos','id_libro_bancos','LBTRINHB','no','obligatorio','transf_interna_haber',1);

--- tipo_estado

insert into wf.ttipo_estado (id_usuario_reg,id_tipo_estado,id_tipo_proceso, codigo, nombre_Estado, inicio, disparador,fin , tipo_asignacion, depto_asignacion, alerta,pedir_obs,plantilla_mensaje, funcion_inicial,funcion_regreso)values(1,485,72,'pendiente','Pendiente', 'no','no','no','ninguno', 'ninguno','no','no','<font color="99CC00" size="5"><font size="4">{TIPO_PROCESO}</font></font><br><br><b>&nbsp;</b>Tramite:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; <b>{NUM_TRAMITE}</b><br><b>&nbsp;</b>Usuario :<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {USUARIO_PREVIO} </b>en estado<b>&nbsp; {ESTADO_ANTERIOR}<br></b>&nbsp;<b>Responsable:&nbsp;&nbsp; &nbsp;&nbsp; </b><b>{FUNCIONARIO_PREVIO}&nbsp; {DEPTO_PREVIO}<br>&nbsp;</b>Estado Actual<b>: &nbsp; &nbsp;&nbsp; {ESTADO_ACTUAL}</b><br><br><br>&nbsp;{OBS} <br>', null,null);
insert into wf.ttipo_estado (id_usuario_reg,id_tipo_estado,id_tipo_proceso, codigo, nombre_Estado, inicio, disparador,fin , tipo_asignacion, depto_asignacion,alerta,pedir_obs,plantilla_mensaje,funcion_inicial,funcion_regreso)values(1,498,76,'pagado','Pagado','no','no','no','ninguno','ninguno','no','no','<font color="99CC00" size="5"><font size="4">{TIPO_PROCESO}</font></font><br><br><b>&nbsp;</b>Tramite:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; <b>{NUM_TRAMITE}</b><br><b>&nbsp;</b>Usuario :<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {USUARIO_PREVIO} </b>en estado<b>&nbsp; {ESTADO_ANTERIOR}<br></b>&nbsp;<b>Responsable:&nbsp;&nbsp; &nbsp;&nbsp; </b><b>{FUNCIONARIO_PREVIO}&nbsp; {DEPTO_PREVIO}<br>&nbsp;</b>Estado Actual<b>: &nbsp; &nbsp;&nbsp; {ESTADO_ACTUAL}</b><br><br><br>&nbsp;{OBS} <br>',null,null);
insert into wf.ttipo_estado (id_usuario_reg,id_tipo_estado,id_tipo_proceso, codigo, nombre_Estado, inicio, disparador,fin , tipo_asignacion, depto_asignacion,alerta,pedir_obs,plantilla_mensaje,funcion_inicial,funcion_regreso)values(1,499,76,'debitado','Debitado','no','no','si','ninguno','ninguno','no','no','<font color="99CC00" size="5"><font size="4">{TIPO_PROCESO}</font></font><br><br><b>&nbsp;</b>Tramite:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; <b>{NUM_TRAMITE}</b><br><b>&nbsp;</b>Usuario :<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {USUARIO_PREVIO} </b>en estado<b>&nbsp; {ESTADO_ANTERIOR}<br></b>&nbsp;<b>Responsable:&nbsp;&nbsp; &nbsp;&nbsp; </b><b>{FUNCIONARIO_PREVIO}&nbsp; {DEPTO_PREVIO}<br>&nbsp;</b>Estado Actual<b>: &nbsp; &nbsp;&nbsp; {ESTADO_ACTUAL}</b><br><br><br>&nbsp;{OBS} <br>',null,null);
insert into wf.ttipo_estado (id_usuario_reg,id_tipo_estado,id_tipo_proceso, codigo, nombre_Estado, inicio, disparador,fin , tipo_asignacion, depto_asignacion,alerta,pedir_obs,plantilla_mensaje,funcion_inicial,funcion_regreso)values(1,500,77,'transferido','Transferido','si','no','si','ninguno','ninguno','no','no','<font color="99CC00" size="5"><font size="4">{TIPO_PROCESO}</font></font><br><br><b>&nbsp;</b>Tramite:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; <b>{NUM_TRAMITE}</b><br><b>&nbsp;</b>Usuario :<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {USUARIO_PREVIO} </b>en estado<b>&nbsp; {ESTADO_ANTERIOR}<br></b>&nbsp;<b>Responsable:&nbsp;&nbsp; &nbsp;&nbsp; </b><b>{FUNCIONARIO_PREVIO}&nbsp; {DEPTO_PREVIO}<br>&nbsp;</b>Estado Actual<b>: &nbsp; &nbsp;&nbsp; {ESTADO_ACTUAL}</b><br><br><br>&nbsp;{OBS} <br>',null,null);
insert into wf.ttipo_estado (id_usuario_reg,id_tipo_estado,id_tipo_proceso, codigo, nombre_Estado, inicio, disparador,fin , tipo_asignacion, depto_asignacion,alerta,pedir_obs,plantilla_mensaje,funcion_inicial,funcion_regreso)values(1,501,78,'transferido','Transferido','si','no','si','ninguno','ninguno','no','no','<font color="99CC00" size="5"><font size="4">{TIPO_PROCESO}</font></font><br><br><b>&nbsp;</b>Tramite:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; <b>{NUM_TRAMITE}</b><br><b>&nbsp;</b>Usuario :<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {USUARIO_PREVIO} </b>en estado<b>&nbsp; {ESTADO_ANTERIOR}<br></b>&nbsp;<b>Responsable:&nbsp;&nbsp; &nbsp;&nbsp; </b><b>{FUNCIONARIO_PREVIO}&nbsp; {DEPTO_PREVIO}<br>&nbsp;</b>Estado Actual<b>: &nbsp; &nbsp;&nbsp; {ESTADO_ACTUAL}</b><br><br><br>&nbsp;{OBS} <br>',null,null);
insert into wf.ttipo_estado (id_usuario_reg,id_tipo_estado,id_tipo_proceso, codigo, nombre_Estado, inicio, disparador,fin , tipo_asignacion, depto_asignacion,alerta,pedir_obs,plantilla_mensaje,funcion_inicial,funcion_regreso)values(1,496,75,'cobrado','Cobrado','no','no','si','ninguno','ninguno','no','no','<font color="99CC00" size="5"><font size="4">{TIPO_PROCESO}</font></font><br><br><b>&nbsp;</b>Tramite:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; <b>{NUM_TRAMITE}</b><br><b>&nbsp;</b>Usuario :<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {USUARIO_PREVIO} </b>en estado<b>&nbsp; {ESTADO_ANTERIOR}<br></b>&nbsp;<b>Responsable:&nbsp;&nbsp; &nbsp;&nbsp; </b><b>{FUNCIONARIO_PREVIO}&nbsp; {DEPTO_PREVIO}<br>&nbsp;</b>Estado Actual<b>: &nbsp; &nbsp;&nbsp; {ESTADO_ACTUAL}</b><br><br><br>&nbsp;{OBS} <br>',null,null);
insert into wf.ttipo_estado (id_usuario_reg,id_tipo_estado,id_tipo_proceso, codigo, nombre_Estado, inicio, disparador,fin , tipo_asignacion, depto_asignacion,alerta,pedir_obs,plantilla_mensaje,funcion_inicial,funcion_regreso)values(1,484,72,'borrador','Borrador','si','no','no','ninguno','ninguno','no','no','<font color="99CC00" size="5"><font size="4">{TIPO_PROCESO}</font></font><br><br><b>&nbsp;</b>Tramite:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; <b>{NUM_TRAMITE}</b><br><b>&nbsp;</b>Usuario :<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {USUARIO_PREVIO} </b>en estado<b>&nbsp; {ESTADO_ANTERIOR}<br></b>&nbsp;<b>Responsable:&nbsp;&nbsp; &nbsp;&nbsp; </b><b>{FUNCIONARIO_PREVIO}&nbsp; {DEPTO_PREVIO}<br>&nbsp;</b>Estado Actual<b>: &nbsp; &nbsp;&nbsp; {ESTADO_ACTUAL}</b><br><br><br>&nbsp;{OBS} <br>','tes.f_fun_aprueba_pago_wf','tes.f_fun_rechaza_pago_wf');
insert into wf.ttipo_estado (id_usuario_reg,id_tipo_estado,id_tipo_proceso, codigo, nombre_Estado, inicio, disparador,fin , tipo_asignacion, depto_asignacion,alerta,pedir_obs,plantilla_mensaje,funcion_inicial,funcion_regreso)values(1,486,72,'impreso','Impreso','no','no','no','ninguno','ninguno','no','no','<font color="99CC00" size="5"><font size="4">{TIPO_PROCESO}</font></font><br><br><b>&nbsp;</b>Tramite:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; <b>{NUM_TRAMITE}</b><br><b>&nbsp;</b>Usuario :<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {USUARIO_PREVIO} </b>en estado<b>&nbsp; {ESTADO_ANTERIOR}<br></b>&nbsp;<b>Responsable:&nbsp;&nbsp; &nbsp;&nbsp; </b><b>{FUNCIONARIO_PREVIO}&nbsp; {DEPTO_PREVIO}<br>&nbsp;</b>Estado Actual<b>: &nbsp; &nbsp;&nbsp; {ESTADO_ACTUAL}</b><br><br><br>&nbsp;{OBS} <br>',null,null);
insert into wf.ttipo_estado (id_usuario_reg,id_tipo_estado,id_tipo_proceso, codigo, nombre_Estado, inicio, disparador,fin , tipo_asignacion, depto_asignacion,alerta,pedir_obs,plantilla_mensaje,funcion_inicial,funcion_regreso)values(1,487,72,'entregado','Entregado','no','no','no','ninguno','ninguno','no','no','<font color="99CC00" size="5"><font size="4">{TIPO_PROCESO}</font></font><br><br><b>&nbsp;</b>Tramite:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; <b>{NUM_TRAMITE}</b><br><b>&nbsp;</b>Usuario :<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {USUARIO_PREVIO} </b>en estado<b>&nbsp; {ESTADO_ANTERIOR}<br></b>&nbsp;<b>Responsable:&nbsp;&nbsp; &nbsp;&nbsp; </b><b>{FUNCIONARIO_PREVIO}&nbsp; {DEPTO_PREVIO}<br>&nbsp;</b>Estado Actual<b>: &nbsp; &nbsp;&nbsp; {ESTADO_ACTUAL}</b><br><br><br>&nbsp;{OBS} <br>',null,null);
insert into wf.ttipo_estado (id_usuario_reg,id_tipo_estado,id_tipo_proceso, codigo, nombre_Estado, inicio, disparador,fin , tipo_asignacion, depto_asignacion,alerta,pedir_obs,plantilla_mensaje,funcion_inicial,funcion_regreso)values(1,488,72,'cobrado','Cobrado','no','no','si','ninguno','ninguno','no','no','<font color="99CC00" size="5"><font size="4">{TIPO_PROCESO}</font></font><br><br><b>&nbsp;</b>Tramite:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; <b>{NUM_TRAMITE}</b><br><b>&nbsp;</b>Usuario :<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {USUARIO_PREVIO} </b>en estado<b>&nbsp; {ESTADO_ANTERIOR}<br></b>&nbsp;<b>Responsable:&nbsp;&nbsp; &nbsp;&nbsp; </b><b>{FUNCIONARIO_PREVIO}&nbsp; {DEPTO_PREVIO}<br>&nbsp;</b>Estado Actual<b>: &nbsp; &nbsp;&nbsp; {ESTADO_ACTUAL}</b><br><br><br>&nbsp;{OBS} <br>',null,null);
insert into wf.ttipo_estado (id_usuario_reg,id_tipo_estado,id_tipo_proceso, codigo, nombre_Estado, inicio, disparador,fin , tipo_asignacion, depto_asignacion,alerta,pedir_obs,plantilla_mensaje,funcion_inicial,funcion_regreso)values(1,489,72,'anulado','Anulado','no','no','si','ninguno','ninguno','no','no','<font color="99CC00" size="5"><font size="4">{TIPO_PROCESO}</font></font><br><br><b>&nbsp;</b>Tramite:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; <b>{NUM_TRAMITE}</b><br><b>&nbsp;</b>Usuario :<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {USUARIO_PREVIO} </b>en estado<b>&nbsp; {ESTADO_ANTERIOR}<br></b>&nbsp;<b>Responsable:&nbsp;&nbsp; &nbsp;&nbsp; </b><b>{FUNCIONARIO_PREVIO}&nbsp; {DEPTO_PREVIO}<br>&nbsp;</b>Estado Actual<b>: &nbsp; &nbsp;&nbsp; {ESTADO_ACTUAL}</b><br><br><br>&nbsp;{OBS} <br>',null,null);
insert into wf.ttipo_estado (id_usuario_reg,id_tipo_estado,id_tipo_proceso, codigo, nombre_Estado, inicio, disparador,fin , tipo_asignacion, depto_asignacion,alerta,pedir_obs,plantilla_mensaje,funcion_inicial,funcion_regreso)values(1,490,72,'reingresado','Reingresado','no','no','si','ninguno','ninguno','no','no','<font color="99CC00" size="5"><font size="4">{TIPO_PROCESO}</font></font><br><br><b>&nbsp;</b>Tramite:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; <b>{NUM_TRAMITE}</b><br><b>&nbsp;</b>Usuario :<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {USUARIO_PREVIO} </b>en estado<b>&nbsp; {ESTADO_ANTERIOR}<br></b>&nbsp;<b>Responsable:&nbsp;&nbsp; &nbsp;&nbsp; </b><b>{FUNCIONARIO_PREVIO}&nbsp; {DEPTO_PREVIO}<br>&nbsp;</b>Estado Actual<b>: &nbsp; &nbsp;&nbsp; {ESTADO_ACTUAL}</b><br><br><br>&nbsp;{OBS} <br>',null,null);
insert into wf.ttipo_estado (id_usuario_reg,id_tipo_estado,id_tipo_proceso, codigo, nombre_Estado, inicio, disparador,fin , tipo_asignacion, depto_asignacion,alerta,pedir_obs,plantilla_mensaje,funcion_inicial,funcion_regreso)values(1,491,73,'borrador','Borrador','si','no','no','ninguno','ninguno','no','no','<font color="99CC00" size="5"><font size="4">{TIPO_PROCESO}</font></font><br><br><b>&nbsp;</b>Tramite:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; <b>{NUM_TRAMITE}</b><br><b>&nbsp;</b>Usuario :<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {USUARIO_PREVIO} </b>en estado<b>&nbsp; {ESTADO_ANTERIOR}<br></b>&nbsp;<b>Responsable:&nbsp;&nbsp; &nbsp;&nbsp; </b><b>{FUNCIONARIO_PREVIO}&nbsp; {DEPTO_PREVIO}<br>&nbsp;</b>Estado Actual<b>: &nbsp; &nbsp;&nbsp; {ESTADO_ACTUAL}</b><br><br><br>&nbsp;{OBS} <br>',null,null);
insert into wf.ttipo_estado (id_usuario_reg,id_tipo_estado,id_tipo_proceso, codigo, nombre_Estado, inicio, disparador,fin , tipo_asignacion, depto_asignacion,alerta,pedir_obs,plantilla_mensaje,funcion_inicial,funcion_regreso)values(1,492,73,'depositado','Depositado','no','no','si','ninguno','ninguno','no','no','<font color="99CC00" size="5"><font size="4">{TIPO_PROCESO}</font></font><br><br><b>&nbsp;</b>Tramite:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; <b>{NUM_TRAMITE}</b><br><b>&nbsp;</b>Usuario :<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {USUARIO_PREVIO} </b>en estado<b>&nbsp; {ESTADO_ANTERIOR}<br></b>&nbsp;<b>Responsable:&nbsp;&nbsp; &nbsp;&nbsp; </b><b>{FUNCIONARIO_PREVIO}&nbsp; {DEPTO_PREVIO}<br>&nbsp;</b>Estado Actual<b>: &nbsp; &nbsp;&nbsp; {ESTADO_ACTUAL}</b><br><br><br>&nbsp;{OBS} <br>',null,null);
insert into wf.ttipo_estado (id_usuario_reg,id_tipo_estado,id_tipo_proceso, codigo, nombre_Estado, inicio, disparador,fin , tipo_asignacion, depto_asignacion,alerta,pedir_obs,plantilla_mensaje,funcion_inicial,funcion_regreso)values(1,493,74,'borrador','Borrador','si','no','no','ninguno','ninguno','no','no','<font color="99CC00" size="5"><font size="4">{TIPO_PROCESO}</font></font><br><br><b>&nbsp;</b>Tramite:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; <b>{NUM_TRAMITE}</b><br><b>&nbsp;</b>Usuario :<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {USUARIO_PREVIO} </b>en estado<b>&nbsp; {ESTADO_ANTERIOR}<br></b>&nbsp;<b>Responsable:&nbsp;&nbsp; &nbsp;&nbsp; </b><b>{FUNCIONARIO_PREVIO}&nbsp; {DEPTO_PREVIO}<br>&nbsp;</b>Estado Actual<b>: &nbsp; &nbsp;&nbsp; {ESTADO_ACTUAL}</b><br><br><br>&nbsp;{OBS} <br>',null,null);
insert into wf.ttipo_estado (id_usuario_reg,id_tipo_estado,id_tipo_proceso, codigo, nombre_Estado, inicio, disparador,fin , tipo_asignacion, depto_asignacion,alerta,pedir_obs,plantilla_mensaje,funcion_inicial,funcion_regreso)values(1,494,74,'cobrado','Cobrado','no','no','si','ninguno','ninguno','no','no','<font color="99CC00" size="5"><font size="4">{TIPO_PROCESO}</font></font><br><br><b>&nbsp;</b>Tramite:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; <b>{NUM_TRAMITE}</b><br><b>&nbsp;</b>Usuario :<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {USUARIO_PREVIO} </b>en estado<b>&nbsp; {ESTADO_ANTERIOR}<br></b>&nbsp;<b>Responsable:&nbsp;&nbsp; &nbsp;&nbsp; </b><b>{FUNCIONARIO_PREVIO}&nbsp; {DEPTO_PREVIO}<br>&nbsp;</b>Estado Actual<b>: &nbsp; &nbsp;&nbsp; {ESTADO_ACTUAL}</b><br><br><br>&nbsp;{OBS} <br>',null,null);
insert into wf.ttipo_estado (id_usuario_reg,id_tipo_estado,id_tipo_proceso, codigo, nombre_Estado, inicio, disparador,fin , tipo_asignacion, depto_asignacion,alerta,pedir_obs,plantilla_mensaje,funcion_inicial,funcion_regreso)values(1,495,75,'borrador','Borrador','si','no','no','ninguno','ninguno','no','no','<font color="99CC00" size="5"><font size="4">{TIPO_PROCESO}</font></font><br><br><b>&nbsp;</b>Tramite:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; <b>{NUM_TRAMITE}</b><br><b>&nbsp;</b>Usuario :<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {USUARIO_PREVIO} </b>en estado<b>&nbsp; {ESTADO_ANTERIOR}<br></b>&nbsp;<b>Responsable:&nbsp;&nbsp; &nbsp;&nbsp; </b><b>{FUNCIONARIO_PREVIO}&nbsp; {DEPTO_PREVIO}<br>&nbsp;</b>Estado Actual<b>: &nbsp; &nbsp;&nbsp; {ESTADO_ACTUAL}</b><br><br><br>&nbsp;{OBS} <br>',null,null);
insert into wf.ttipo_estado (id_usuario_reg,id_tipo_estado,id_tipo_proceso, codigo, nombre_Estado, inicio, disparador,fin , tipo_asignacion, depto_asignacion,alerta,pedir_obs,plantilla_mensaje,funcion_inicial,funcion_regreso)values(1,497,76,'borrador','Borrador','si','no','no','ninguno','ninguno','no','no','<font color="99CC00" size="5"><font size="4">{TIPO_PROCESO}</font></font><br><br><b>&nbsp;</b>Tramite:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; <b>{NUM_TRAMITE}</b><br><b>&nbsp;</b>Usuario :<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {USUARIO_PREVIO} </b>en estado<b>&nbsp; {ESTADO_ANTERIOR}<br></b>&nbsp;<b>Responsable:&nbsp;&nbsp; &nbsp;&nbsp; </b><b>{FUNCIONARIO_PREVIO}&nbsp; {DEPTO_PREVIO}<br>&nbsp;</b>Estado Actual<b>: &nbsp; &nbsp;&nbsp; {ESTADO_ACTUAL}</b><br><br><br>&nbsp;{OBS} <br>',null,null);
insert into wf.ttipo_estado (id_usuario_reg,id_tipo_estado,id_tipo_proceso, codigo, nombre_Estado, inicio, disparador,fin , tipo_asignacion, depto_asignacion,alerta,pedir_obs,plantilla_mensaje,funcion_inicial,funcion_regreso)values(1,502,79,'transferido','Transferido','si','no','si','ninguno','ninguno','no','no','<font color="99CC00" size="5"><font size="4">{TIPO_PROCESO}</font></font><br><br><b>&nbsp;</b>Tramite:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; <b>{NUM_TRAMITE}</b><br><b>&nbsp;</b>Usuario :<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {USUARIO_PREVIO} </b>en estado<b>&nbsp; {ESTADO_ANTERIOR}<br></b>&nbsp;<b>Responsable:&nbsp;&nbsp; &nbsp;&nbsp; </b><b>{FUNCIONARIO_PREVIO}&nbsp; {DEPTO_PREVIO}<br>&nbsp;</b>Estado Actual<b>: &nbsp; &nbsp;&nbsp; {ESTADO_ACTUAL}</b><br><br><br>&nbsp;{OBS} <br>',null,null);
insert into wf.ttipo_estado (id_usuario_reg,id_tipo_estado,id_tipo_proceso, codigo, nombre_Estado, inicio, disparador,fin , tipo_asignacion, depto_asignacion,alerta,pedir_obs,plantilla_mensaje,funcion_inicial,funcion_regreso)values(1,503,72,'vbpagosindocumento','visto bueno finanzas pago sin documento','no','no','no','listado','ninguno','si','no','<font color="99CC00" size="5"><font size="4">{TIPO_PROCESO}</font></font><br><br><b>&nbsp;</b>Tramite:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; <b>{NUM_TRAMITE}</b><br><b>&nbsp;</b>Usuario :<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {USUARIO_PREVIO} </b>en estado<b>&nbsp; {ESTADO_ANTERIOR}<br></b>&nbsp;<b>Responsable:&nbsp;&nbsp; &nbsp;&nbsp; </b><b>{FUNCIONARIO_PREVIO}&nbsp; {DEPTO_PREVIO}<br>&nbsp;</b>Estado Actual<b>: &nbsp; &nbsp;&nbsp; {ESTADO_ACTUAL}</b><br><br><br>&nbsp;{OBS} <br>',null,null);
insert into wf.ttipo_estado (id_usuario_reg,id_tipo_estado,id_tipo_proceso, codigo, nombre_Estado, inicio, disparador,fin , tipo_asignacion, depto_asignacion,alerta,pedir_obs,plantilla_mensaje,funcion_inicial,funcion_regreso)values(1,504,72,'depositado','Depositado','no','no','si','ninguno','ninguno','no','no','<font color="99CC00" size="5"><font size="4">{TIPO_PROCESO}</font></font><br><br><b>&nbsp;</b>Tramite:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; <b>{NUM_TRAMITE}</b><br><b>&nbsp;</b>Usuario :<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {USUARIO_PREVIO} </b>en estado<b>&nbsp; {ESTADO_ANTERIOR}<br></b>&nbsp;<b>Responsable:&nbsp;&nbsp; &nbsp;&nbsp; </b><b>{FUNCIONARIO_PREVIO}&nbsp; {DEPTO_PREVIO}<br>&nbsp;</b>Estado Actual<b>: &nbsp; &nbsp;&nbsp; {ESTADO_ACTUAL}</b><br><br><br>&nbsp;{OBS} <br>',null,null);
insert into wf.ttipo_estado (id_usuario_reg,id_tipo_estado,id_tipo_proceso, codigo, nombre_Estado, inicio, disparador,fin , tipo_asignacion, depto_asignacion,alerta,pedir_obs,plantilla_mensaje,funcion_inicial,funcion_regreso)values(1,505,72,'sigep_swift','Sigep Swift','no','no','no','listado','ninguno','no','no','<font color="99CC00" size="5"><font size="4">{TIPO_PROCESO}</font></font><br><br><b>&nbsp;</b>Tramite:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; <b>{NUM_TRAMITE}</b><br><b>&nbsp;</b>Usuario :<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {USUARIO_PREVIO} </b>en estado<b>&nbsp; {ESTADO_ANTERIOR}<br></b>&nbsp;<b>Responsable:&nbsp;&nbsp; &nbsp;&nbsp; </b><b>{FUNCIONARIO_PREVIO}&nbsp; {DEPTO_PREVIO}<br>&nbsp;</b>Estado Actual<b>: &nbsp; &nbsp;&nbsp; {ESTADO_ACTUAL}</b><br><br><br>&nbsp;{OBS} <br>',null,null);

---estructura_estado

insert into wf.testructura_estado (id_usuario_reg,id_estructura_estado,id_tipo_estado_padre,id_tipo_estado_hijo,prioridad, regla, modificado, bucle) values (1,500,497,498,1,null,1,'no');
insert into wf.testructura_estado (id_usuario_reg,id_estructura_estado,id_tipo_estado_padre,id_tipo_estado_hijo,prioridad, regla, modificado, bucle) values (1,507,505,488,1,null,1,'no');
insert into wf.testructura_estado (id_usuario_reg,id_estructura_estado,id_tipo_estado_padre,id_tipo_estado_hijo,prioridad, regla, modificado, bucle) values (1,489,486,489,1,null,1,'no');
insert into wf.testructura_estado (id_usuario_reg,id_estructura_estado,id_tipo_estado_padre,id_tipo_estado_hijo,prioridad, regla, modificado, bucle) values (1,490,486,490,1,null,1,'no');
insert into wf.testructura_estado (id_usuario_reg,id_estructura_estado,id_tipo_estado_padre,id_tipo_estado_hijo,prioridad, regla, modificado, bucle) values (1,491,486,487,1,null,1,'no');
insert into wf.testructura_estado (id_usuario_reg,id_estructura_estado,id_tipo_estado_padre,id_tipo_estado_hijo,prioridad, regla, modificado, bucle) values (1,492,487,488,1,null,1,'no');
insert into wf.testructura_estado (id_usuario_reg,id_estructura_estado,id_tipo_estado_padre,id_tipo_estado_hijo,prioridad, regla, modificado, bucle) values (1,493,487,489,1,null,1,'no');
insert into wf.testructura_estado (id_usuario_reg,id_estructura_estado,id_tipo_estado_padre,id_tipo_estado_hijo,prioridad, regla, modificado, bucle) values (1,494,487,490,1,null,1,'no');
insert into wf.testructura_estado (id_usuario_reg,id_estructura_estado,id_tipo_estado_padre,id_tipo_estado_hijo,prioridad, regla, modificado, bucle) values (1,495,491,492,1,null,1,'no');
insert into wf.testructura_estado (id_usuario_reg,id_estructura_estado,id_tipo_estado_padre,id_tipo_estado_hijo,prioridad, regla, modificado, bucle) values (1,496,493,494,1,null,1,'no');
insert into wf.testructura_estado (id_usuario_reg,id_estructura_estado,id_tipo_estado_padre,id_tipo_estado_hijo,prioridad, regla, modificado, bucle) values (1,497,495,496,1,null,1,'no');
insert into wf.testructura_estado (id_usuario_reg,id_estructura_estado,id_tipo_estado_padre,id_tipo_estado_hijo,prioridad, regla, modificado, bucle) values (1,499,486,488,1,null,1,'no');
insert into wf.testructura_estado (id_usuario_reg,id_estructura_estado,id_tipo_estado_padre,id_tipo_estado_hijo,prioridad, regla, modificado, bucle) values (1,501,498,499,1,null,1,'no');
insert into wf.testructura_estado (id_usuario_reg,id_estructura_estado,id_tipo_estado_padre,id_tipo_estado_hijo,prioridad, regla, modificado, bucle) values (1,503,503,484,1,null,1,'no');
insert into wf.testructura_estado (id_usuario_reg,id_estructura_estado,id_tipo_estado_padre,id_tipo_estado_hijo,prioridad, regla, modificado, bucle) values (1,504,484,504,1,'"{$tabla.tipo}"="deposito"',1,'no');
insert into wf.testructura_estado (id_usuario_reg,id_estructura_estado,id_tipo_estado_padre,id_tipo_estado_hijo,prioridad, regla, modificado, bucle) values (1,505,484,488,1,'"{$tabla.tipo}" in ("transferencia_carta","debito_automatico")',1,'no');
insert into wf.testructura_estado (id_usuario_reg,id_estructura_estado,id_tipo_estado_padre,id_tipo_estado_hijo,prioridad, regla, modificado, bucle) values (1,506,484,505,1,'"{$tabla.tipo}" in ("transferencia_carta")',1,'no');
insert into wf.testructura_estado (id_usuario_reg,id_estructura_estado,id_tipo_estado_padre,id_tipo_estado_hijo,prioridad, regla, modificado, bucle) values (1,498,484,486,1,'"{$tabla.tipo}"="cheque"',1,'no');
insert into wf.testructura_estado (id_usuario_reg,id_estructura_estado,id_tipo_estado_padre,id_tipo_estado_hijo,prioridad, regla, modificado, bucle) values (1,502,484,503,1,'"{$tabla.tipo}"="cheque"',0,'no');

/***********************************F-DAT-RCM-TES-0-26/09/2019*****************************************/

/***********************************I-DAT-RCM-TES-0-09/10/2019*****************************************/
----------------------------------
--COPY LINES TO SUBSYSTEM data.sql FILE
---------------------------------

select wf.f_import_tproceso_macro ('insert','PU', 'TES', 'Obligacion de Pago Único','si');
select wf.f_import_tcategoria_documento ('insert','legales', 'Legales');
select wf.f_import_tcategoria_documento ('insert','proceso', 'Proceso');
select wf.f_import_ttipo_proceso ('insert','OPU',NULL,NULL,'PU','Solicitud de Pago Unico','tes.vobligacion_pago','id_obligacion_pago','si','','obligatorio','','obligacion_pago',NULL);
select wf.f_import_ttipo_proceso ('insert','PUPLAP','en_pago','OPU','PU','Flujo Plan de Pago Unico (Devengado)','tes.vcomp_devtesprov_plan_pago_2','id_plan_pago','no','','null','','PUPLAP',NULL);
select wf.f_import_ttipo_proceso ('insert','PUPLPP',NULL,NULL,'PU','Flujo Plan de Pago Unico (Pagado)','tes.vcomp_devtesprov_plan_pago_2','id_plan_pago','','','null','','PUPLPP',NULL);
select wf.f_import_ttipo_proceso ('insert','PU_ANT_PAR',NULL,NULL,'PU','Pagos Especiales Único (Antic., Devol. Garantia)','tes.vcomp_devtesprov_plan_pago_2','id_plan_pago','no','','opcional','','ANT_PAR',NULL);
select wf.f_import_ttipo_proceso ('insert','PU_AP_ANT','en_pago','OPU','PU','Aplicacion de Anticipo Único','tes.vcomp_devtesprov_plan_pago_2','id_plan_pago','no','','opcional','LA aplicaciond e anticipo se aplica solo sobre anticipo totales, es para ejecutar presupesuto y llevar al gasto el anticipo entregado','AP_ANT',NULL);
select wf.f_import_ttabla ('insert','PP','PUPLAP','plan_pago','','','maestro','',NULL,'3','DESC','','','b','',NULL,'','');
select wf.f_import_ttipo_estado ('insert','borrador','OPU','Borrador','si','no','no','ninguno','','depto_func_list','adq.f_lista_depto_tesoreria_wf_sel','','no','no',NULL,'','Nuevo tramite {NUM_TRAMITE} en estado "{ESTADO_ACTUAL}"','','no','','','','','notificacion','','{}',NULL);
select wf.f_import_ttipo_estado ('insert','en_pago','OPU','En pago','no','si','no','anterior','','anterior','',NULL,'no','no',NULL,'','Nuevo tramite {NUM_TRAMITE} en estado "{ESTADO_ACTUAL}"',NULL,'no',NULL,NULL,NULL,NULL,'notificacion',NULL,'{}',NULL);
select wf.f_import_ttipo_estado ('insert','registrado','OPU','Certificado','no','si','no','funcion_listado','tes.f_lista_funcionario_registro_op','ninguno','','','si','no',NULL,'El proceso fue aprobado en el área de presupuestos, puede continuar con el registro del plan de pago y dar la conformidad para el pago cuando este listo','Nuevo tramite {NUM_TRAMITE} en estado "{ESTADO_ACTUAL}"','','no','','','','','notificacion','','{}',NULL);
select wf.f_import_ttipo_estado ('insert','finalizado','OPU','Finalizado','no','si','si','anterior','','anterior','','','no','no',NULL,'','Nuevo tramite {NUM_TRAMITE} en estado "{ESTADO_ACTUAL}"','','no','','','','','notificacion','','{}',NULL);

select wf.f_import_ttipo_estado ('insert','anulado','OPU', 'Anulado','no','no','si','anterior','','anterior','',NULL,'no','no',NULL,'','Nuevo tramite {NUM_TRAMITE} en estado "{ESTADO_ACTUAL}"',NULL,'no',NULL,NULL,NULL,NULL,'notificacion',NULL,'{}',NULL);

select wf.f_import_ttipo_estado ('insert','borrador','PUPLAP','Borrador', 'si','no','no','anterior','','anterior','','','no','no',NULL,'','Nuevo tramite {NUM_TRAMITE} en estado "{ESTADO_ACTUAL}"','','no','','tes.f_fun_regreso_plan_pago_wf','','','notificacion','','{}',NULL);

select wf.f_import_ttipo_estado ('insert','pendiente','PUPLAP','Pendiente','no','si','no','anterior','','anterior','','','no','no',NULL,'','Nuevo tramite {NUM_TRAMITE} en estado "{ESTADO_ACTUAL}"','','no','','','','','notificacion','','{}',NULL);

select wf.f_import_ttipo_estado ('insert','devengado','PUPLAP','Devengado','no','si','si','anterior','','anterior','','','no','no',NULL,'','Nuevo tramite {NUM_TRAMITE} en estado "{ESTADO_ACTUAL}"','','no','','','','','notificacion','','{}',NULL);

select wf.f_import_ttipo_estado ('insert','anulado','PUPLAP','Anulado','no','no','si','anterior','','anterior','',NULL,'no','no',NULL,'','Nuevo tramite {NUM_TRAMITE} en estado "{ESTADO_ACTUAL}"',NULL,'no',NULL,NULL,NULL,NULL,'notificacion',NULL,'{}',NULL);

select wf.f_import_ttipo_estado ('insert','borrador','PUPLPP','Borrador','si','no','no','anterior','','anterior','','','no','no',NULL,'','Nuevo tramite {NUM_TRAMITE} en estado "{ESTADO_ACTUAL}"','','no','','tes.f_fun_regreso_plan_pago_wf','','','notificacion','','{}',NULL);

select wf.f_import_ttipo_estado ('insert','pendiente','PUPLPP','Pendiente','no','si','no','anterior','','anterior','','','no','no',NULL,'','Nuevo tramite {NUM_TRAMITE} en estado "{ESTADO_ACTUAL}"','','no','','','','','notificacion','','{}',NULL);

select wf.f_import_ttipo_estado ('insert','pagado','PUPLPP','Contabilizado','no','si','si','anterior','','anterior','','','no','no',NULL,'','Nuevo tramite {NUM_TRAMITE} en estado "{ESTADO_ACTUAL}"','','no','','','','','notificacion','','{}',NULL);

select wf.f_import_ttipo_estado ('insert','anulado','PUPLPP','Anulado','no','no','si','anterior','','anterior','',NULL,'no','no',NULL,'','Nuevo tramite {NUM_TRAMITE} en estado "{ESTADO_ACTUAL}"',NULL,'no',NULL,NULL,NULL,NULL,'notificacion',NULL,'{}',NULL);

select wf.f_import_ttipo_estado ('insert','vbconta','PUPLAP','VoBo Contabilidad','no','no','no','segun_depto','','depto_func_list','tes.f_lista_depto_conta_x_lb_wf_sel','','si','no',NULL,'','Nuevo tramite {NUM_TRAMITE} en estado "{ESTADO_ACTUAL}"','auxiliar,responsable','no','tes.f_fun_inicio_plan_pago_wf','','../../../sis_tesoreria/vista/plan_pago/PlanPagoVb.php','PlanPagoVb','notificacion','Vinsto Bueno Contabilidad','plapa.id_proceso_wf',NULL);

select wf.f_import_ttipo_estado ('insert','vbconta','PUPLPP','VoBo Contabilidad','no','no','no','segun_depto','','depto_func_list','tes.f_lista_depto_conta_x_lb_wf_sel','','si','no',NULL,'','Nuevo tramite {NUM_TRAMITE} en estado "{ESTADO_ACTUAL}"','responsable,auxiliar','no','tes.f_fun_inicio_plan_pago_wf','','','','notificacion','','{}',NULL);

select wf.f_import_ttipo_estado ('insert','vbfin','PUPLAP','VoBo Dpto. Finanzas','no','no','no','listado','','ninguno','','','si','no',NULL,'','Nuevo tramite {NUM_TRAMITE} en estado "{ESTADO_ACTUAL}"','','si','tes.f_fun_inicio_plan_pago_wf','tes.f_fun_regreso_plan_pago_wf','../../../sis_tesoreria/vista/plan_pago/PlanPagoVb.php','PlanPagoVb','notificacion','Vinsto Bueno Finanzas','plapa.id_proceso_wf',NULL);

select wf.f_import_ttipo_estado ('insert','borrador','PU_ANT_PAR','Borrador','si','no','no','anterior','','anterior','','','no','no',NULL,'','Nuevo tramite {NUM_TRAMITE} en estado "{ESTADO_ACTUAL}"','','no','','tes.f_fun_regreso_plan_pago_wf',NULL,NULL,'notificacion',NULL,'{}',NULL);

select wf.f_import_ttipo_estado ('insert','pendiente','PU_ANT_PAR','Pendiente','no','si','no','anterior','','anterior','','','no','no',NULL,'','Nuevo tramite {NUM_TRAMITE} en estado "{ESTADO_ACTUAL}"','','no','','','','','notificacion','','{}',NULL);

select wf.f_import_ttipo_estado ('insert','vbconta','PU_ANT_PAR','VoBo Contabilidad','no','no','no','segun_depto','','depto_func_list','tes.f_lista_depto_conta_x_lb_wf_sel','','si','no',NULL,'','Nuevo tramite {NUM_TRAMITE} en estado "{ESTADO_ACTUAL}"','responsable,auxiliar','no','tes.f_fun_inicio_plan_pago_wf','tes.f_fun_regreso_plan_pago_wf','../../../sis_tesoreria/vista/plan_pago/PlanPagoVb.php','PlanPagoVb','notificacion','Visto bueno Contabilidad','plapa.id_proceso_wf',NULL);

select wf.f_import_ttipo_estado ('insert','vbfin','PU_ANT_PAR','VoBo Dpto. Finanzas','no','no','no','listado','','ninguno','','','si','no',NULL,'','Nuevo tramite {NUM_TRAMITE} en estado "{ESTADO_ACTUAL}"','','no','tes.f_fun_inicio_plan_pago_wf','tes.f_fun_regreso_plan_pago_wf','../../../sis_tesoreria/vista/plan_pago/PlanPagoVb.php','PlanPagoVb','notificacion','Visto bueno Finanzas','plapa.id_proceso_wf',NULL);

select wf.f_import_ttipo_estado ('insert','anulado','PU_ANT_PAR','Anulado','no','no','si','anterior','','anterior','','','no','no',NULL,'','Nuevo tramite {NUM_TRAMITE} en estado "{ESTADO_ACTUAL}"','','no','','','','','notificacion','','{}',NULL);

select wf.f_import_ttipo_estado ('insert','anticipado','PU_ANT_PAR','Anticipado','no','si','si','anterior','','anterior','','','no','no',NULL,'','Nuevo tramite {NUM_TRAMITE} en estado "{ESTADO_ACTUAL}"','','no','','','','','notificacion','','{}',NULL);

select wf.f_import_ttipo_estado ('insert','devuelto','PU_ANT_PAR','Devuelto','no','no','si','anterior','','anterior','','','no','no',NULL,'','Nuevo tramite {NUM_TRAMITE} en estado "{ESTADO_ACTUAL}"','','no','','','','','notificacion','','{}',NULL);

select wf.f_import_ttipo_estado ('insert','borrador','PU_AP_ANT','Borrador','si','no','no','ninguno','','ninguno','','','no','no',NULL,'','Nuevo tramite {NUM_TRAMITE} en estado "{ESTADO_ACTUAL}"','','no','','tes.f_fun_regreso_plan_pago_wf','','','notificacion','','{}',NULL);

select wf.f_import_ttipo_estado ('insert','vbconta','PU_AP_ANT','VoBo Contabilidad','no','no','no','segun_depto','','depto_func_list','tes.f_lista_depto_conta_x_lb_wf_sel','','si','no',NULL,'','Nuevo tramite {NUM_TRAMITE} en estado "{ESTADO_ACTUAL}"','responsable,auxiliar','no','tes.f_fun_inicio_plan_pago_wf','','','','notificacion','','{}',NULL);

select wf.f_import_ttipo_estado ('insert','pendiente','PU_AP_ANT','Pendiente','no','si','no','anterior','','anterior','','','no','no',NULL,'','Nuevo tramite {NUM_TRAMITE} en estado "{ESTADO_ACTUAL}"','','no','','','','','notificacion','','{}',NULL);

select wf.f_import_ttipo_estado ('insert','aplicado','PU_AP_ANT','Aplicado','no','no','si','anterior','','anterior','','','no','no',NULL,'','Nuevo tramite {NUM_TRAMITE} en estado "{ESTADO_ACTUAL}"','','no','','','','','notificacion','','{}',NULL);

select wf.f_import_ttipo_estado ('insert','anulado','PU_AP_ANT','Anulado','no','no','si','anterior','','anterior','','','no','no',NULL,'','Nuevo tramite {NUM_TRAMITE} en estado "{ESTADO_ACTUAL}"','','no','','','','','notificacion','','{}',NULL);

select wf.f_import_ttipo_estado ('insert','vbsolicitante','PUPLAP','VoBo Solicitante','no','no','no','funcion_listado','ADQ_SOL_COMPRA','ninguno','','','si','no',NULL,'','Nuevo tramite {NUM_TRAMITE} en estado "{ESTADO_ACTUAL}"','','no','tes.f_fun_inicio_plan_pago_wf','tes.f_fun_regreso_plan_pago_wf','../../../sis_tesoreria/vista/plan_pago/PlanPagoVb.php','PlanPagoVb','notificacion','Visto bueno solicitante','plapa.id_proceso_wf',NULL);

select wf.f_import_ttipo_estado ('insert','vbsolicitante','PU_ANT_PAR','VoBo Solicitante','no','no','no','funcion_listado','ADQ_SOL_COMPRA','ninguno','','','si','no',NULL,'','Nuevo tramite {NUM_TRAMITE} en estado "{ESTADO_ACTUAL}"','','no','tes.f_fun_inicio_plan_pago_wf','tes.f_fun_regreso_plan_pago_wf','../../../sis_tesoreria/vista/plan_pago/PlanPagoVb.php','PlanPagoVb','notificacion','Visto bueno solicitante','plapa.id_proceso_wf',NULL);

select wf.f_import_ttipo_estado ('insert','vbgerente','PUPLAP','VoBo Gerente','no','no','no','funcion_listado','tes.f_lista_funcionario_gerente_op_wf_sel','ninguno','','','si','no',NULL,'','Nuevo tramite {NUM_TRAMITE} en estado "{ESTADO_ACTUAL}"','','si','tes.f_fun_inicio_plan_pago_wf','tes.f_fun_regreso_plan_pago_wf','../../../sis_tesoreria/vista/plan_pago/PlanPagoVb.php','PlanPagoVb','notificacion','Visto bueno gerente','plapa.id_proceso_wf',NULL);

select wf.f_import_ttipo_estado ('insert','vbpresupuestos','OPU','VoBo Presupuestos','no','no','no','listado','','ninguno','','','si','no',NULL,'','Nuevo tramite {NUM_TRAMITE} en estado "{ESTADO_ACTUAL}"','','no','','','','','','','','borrador');

select wf.f_import_ttipo_estado ('insert','supconta','PUPLAP','Sup Contabilidad','no','no','no','listado','','depto_func_list','tes.f_lista_depto_conta_x_lb_wf_sel','','no','si',NULL,'','Nuevo tramite {NUM_TRAMITE} en estado "{ESTADO_ACTUAL}"','responsable','no','tes.f_fun_inicio_plan_pago_wf','','../../../sis_tesoreria/vista/plan_pago/PlanPagoVb.php','PlanPagoVb','notificacion','Vinsto Bueno Contabilidad','plapa.id_proceso_wf',NULL);

select wf.f_import_ttipo_estado ('insert','vbgerente','PU_ANT_PAR','VoBo Gerente','no','no','no','funcion_listado','tes.f_lista_funcionario_gerente_op_wf_sel','ninguno','','','si','no',NULL,'','Nuevo tramite {NUM_TRAMITE} en estado "{ESTADO_ACTUAL}"','','si','tes.f_fun_inicio_plan_pago_wf','tes.f_fun_regreso_plan_pago_wf','../../../sis_tesoreria/vista/plan_pago/PlanPagoVb.php','PlanPagoVb','notificacion','Visto bueno gerente','plapa.id_proceso_wf',NULL);

select wf.f_import_ttipo_estado ('insert','vbpoa','OPU','VoBo POA','no','no','no','listado','','ninguno','','','si','si',NULL,'','Nuevo tramite {NUM_TRAMITE} en estado "{ESTADO_ACTUAL}"','','no','','','','','','','','borrador');

select wf.f_import_ttipo_estado ('insert','vbdeposito','PUPLAP','VoBo Gerente (Deposito)','no','no','no','funcion_listado','tes.f_lista_funcionario_gerente_op_wf_sel','ninguno','','','si','no',NULL,'','Nuevo tramite {NUM_TRAMITE} en estado "{ESTADO_ACTUAL}"','','no','tes.f_fun_inicio_plan_pago_wf','tes.f_fun_regreso_plan_pago_wf','../../../sis_tesoreria/vista/plan_pago/PlanPagoVb.php','PlanPagoVb','notificacion','Visto bueno gerente (Deposito)','plapa.id_proceso_wf',NULL);

select wf.f_import_ttipo_estado ('insert','suppresu','OPU','Supervisor Presupuestos','no','no','no','listado','','ninguno','','','si','no',NULL,'','Nuevo tramite {NUM_TRAMITE} en estado "{ESTADO_ACTUAL}"','','no','','','','','','','','borrador');

select wf.f_import_ttipo_estado ('insert','supcostos','PUPLAP','Sup Costos','no','no','no','listado','','ninguno','','','si','si',NULL,'','Nuevo tramite {NUM_TRAMITE} en estado "{ESTADO_ACTUAL}"','','si','tes.f_fun_inicio_plan_pago_wf','tes.f_fun_regreso_plan_pago_wf','../../../sis_tesoreria/vista/plan_pago/PlanPagoVb.php','PlanPagoVb','notificacion','Supervicion Costos','plapa.id_proceso_wf',NULL);

select wf.f_import_ttipo_estado ('insert','vbcostos','PUPLAP','VoBo Costos','no','no','no','listado','','ninguno','','','si','no',NULL,'','Nuevo tramite {NUM_TRAMITE} en estado "{ESTADO_ACTUAL}"','','no','','','','','','','',NULL);

select wf.f_import_ttipo_estado ('insert','pago_exterior','PUPLAP','Pagado en el Exterior','no','no','si','ninguno','','ninguno','','','no','no',NULL,'','Aviso WF ,  {PROCESO_MACRO}  ({NUM_TRAMITE})','','no','','','','','','','',NULL);

select wf.f_import_ttipo_estado ('insert','vb_jefe_aeropuerto','OPU','VoBo Jefe de Aeropuerto','no','no','no','listado','','ninguno','','','si','si',NULL,'','Aviso WF ,  {PROCESO_MACRO}  ({NUM_TRAMITE})','','no','','','','','','','',NULL);

select wf.f_import_ttipo_estado ('insert','vb_jefe_trafico','PUPLAP','VoBo Jefe de Trafico','no','no','no','listado','','ninguno','','','si','no',NULL,'','Nuevo tramite {NUM_TRAMITE} en estado "{ESTADO_ACTUAL}"','','si','','','','','','','',NULL);

select wf.f_import_ttipo_estado ('insert','liberacion','OPU','Liberación','no','no','no','listado','orga.f_lista_responsable','ninguno','','tes.f_lista_funcionario_aprobador','si','si',NULL,
'',
'Aviso WF ,  {PROCESO_MACRO}  ({NUM_TRAMITE})','','no','','','','','','','',NULL);





select wf.f_import_ttipo_columna ('insert','id_depto_lb','PP','PUPLAP','integer','','','','','','','','NumberField','Libro de Bancos','no','','',NULL,NULL);
select wf.f_import_ttipo_documento ('insert','DocRespaldo','PUPLAP','Prefactura','Documento de respaldo para inicio de pago ','','escaneado',0.00,NULL);
select wf.f_import_ttipo_documento ('insert','ACTCONF','PUPLAP','Acta de Conformidad / Recepcion ERP','Acta de conformidad de entrega de bienes o servicios','sis_tesoreria/control/PlanPago/reporteActaConformidad','generado',0.00,'{}');
select wf.f_import_ttipo_documento ('insert','OTRDOC','PUPLAP','Otros Documentos','Otros documentos a ser presentados','','escaneado',0.00,NULL);
select wf.f_import_ttipo_documento ('insert','DOCRES','PU_AP_ANT','Documento de respaldo de la aplicacion','Documento de respaldo de la aplicación','','escaneado',0.00,NULL);
select wf.f_import_ttipo_documento ('insert','DOCRES','OPU','Documento de Respaldo','Documentos de respaldo para el pago','','escaneado',99.00,'{proceso}');
select wf.f_import_ttipo_documento ('insert','FACTURA','OPU','Factura / Invoice / Recibo','Factura / Invoice / Recibo','','escaneado',0.50,'{proceso}');
select wf.f_import_ttipo_documento ('insert','INFORME','OPU','Informe','Informe','','escaneado',99.00,'{proceso}');
select wf.f_import_ttipo_documento ('insert','NOTINT','OPU','Nota Interna','Nota Interna','','escaneado',99.00,'{proceso}');
select wf.f_import_ttipo_documento ('insert','OTRO','OPU','Otros Documentos','Otros Documentos','','escaneado',99.00,'{proceso}');
select wf.f_import_ttipo_documento ('insert','CORELE','OPU','Correo Electronico','Correo Electronico','','escaneado',99.00,'{proceso}');
select wf.f_import_ttipo_documento ('insert','DAPROPAG','OPU','Datos Bancarios del Beneficiario','Datos Bancarios del Beneficiario','','escaneado',99.00,'{proceso}');
select wf.f_import_ttipo_documento ('insert','PIR','OPU','PIR - Parte de Irregularidad Recibida','PIR - Parte de Irregularidad Recibida','','escaneado',99.00,'{}');
select wf.f_import_ttipo_documento ('insert','OTRO','PU_AP_ANT','Otros Documentos','Otros Documentos','','escaneado',2.00,'{proceso}');
select wf.f_import_ttipo_documento ('insert','OTRO','PU_ANT_PAR','Otros Documentos','Otros Documentos','','escaneado',1.00,'{proceso}');
select wf.f_import_ttipo_documento ('insert','GARCON','OPU','Garantía de cumplimiento de contrato','Garantía de cumplimiento de contrato','','escaneado',1.00,'{}');
select wf.f_import_ttipo_documento ('insert','CONMOD','OPU','Contrato modificatorio','Contrato modificatorio','','escaneado',2.00,'{}');
select wf.f_import_ttipo_documento ('insert','ORDCAM','OPU','Orden de cambio','Orden de cambio','','escaneado',3.00,'{}');
select wf.f_import_ttipo_documento ('insert','SERV','OPU','Servidumbre','Servidumbre','','escaneado',0.00,'{}');
select wf.f_import_tcolumna_estado ('insert','id_depto_lb','PP','PUPLAP','vbfin','exigir','');
select wf.f_import_testructura_estado ('insert','en_pago','finalizado','OPU',1,NULL);
select wf.f_import_testructura_estado ('insert','vbconta','pendiente','PUPLAP',1,NULL);
select wf.f_import_testructura_estado ('insert','pendiente','devengado','PUPLAP',1,NULL);
select wf.f_import_testructura_estado ('insert','vbconta','pendiente','PUPLPP',1,NULL);
select wf.f_import_testructura_estado ('insert','pendiente','pagado','PUPLPP',1,NULL);
select wf.f_import_testructura_estado ('insert','borrador','vbconta','PUPLPP',1,NULL);
select wf.f_import_testructura_estado ('insert','registrado','en_pago','OPU',1,NULL);
select wf.f_import_testructura_estado ('insert','vbfin','vbconta','PU_ANT_PAR',1,'');
select wf.f_import_testructura_estado ('insert','vbconta','pendiente','PU_ANT_PAR',1,'');
select wf.f_import_testructura_estado ('insert','pendiente','anticipado','PU_ANT_PAR',1,'"{$tabla.tipo}"!="dev_garantia"');
select wf.f_import_testructura_estado ('insert','pendiente','devuelto','PU_ANT_PAR',1,'"{$tabla.tipo}"="dev_garantia"');
select wf.f_import_testructura_estado ('insert','borrador','vbconta','PU_AP_ANT',1,'');
select wf.f_import_testructura_estado ('insert','vbconta','pendiente','PU_AP_ANT',1,'');
select wf.f_import_testructura_estado ('insert','pendiente','aplicado','PU_AP_ANT',1,'');
select wf.f_import_testructura_estado ('insert','vbsolicitante','vbfin','PUPLAP',1,'');
select wf.f_import_testructura_estado ('insert','vbsolicitante','vbfin','PU_ANT_PAR',1,'');
select wf.f_import_testructura_estado ('insert','vbgerente','vbfin','PUPLAP',1,'');
select wf.f_import_testructura_estado ('insert','vbpresupuestos','registrado','OPU',1,'');
select wf.f_import_testructura_estado ('insert','supconta','vbconta','PUPLAP',1,'');
select wf.f_import_testructura_estado ('insert','vbfin','supconta','PUPLAP',1,'NOT! tes.f_regla_tiene_servicio_o_lib_banco_inter');
select wf.f_import_testructura_estado ('insert','vbgerente','vbfin','PU_ANT_PAR',1,'');
select wf.f_import_testructura_estado ('insert','vbdeposito','supconta','PUPLAP',1,'{$tabla.prioridad_lb} != 0');
select wf.f_import_testructura_estado ('insert','vbdeposito','vbfin','PUPLAP',1,'{$tabla.prioridad_lb} = 0');
select wf.f_import_testructura_estado ('insert','suppresu','vbpresupuestos','OPU',1,'');
select wf.f_import_testructura_estado ('insert','vbpoa','suppresu','OPU',1,'');
select wf.f_import_testructura_estado ('insert','vbfin','supcostos','PUPLAP',1,'tes.f_regla_tiene_servicio_o_lib_banco_inter');
select wf.f_import_testructura_estado ('insert','supcostos','vbcostos','PUPLAP',1,'');
select wf.f_import_testructura_estado ('insert','vbcostos','supconta','PUPLAP',1,'{$tabla.prioridad_lb} != 3');
select wf.f_import_testructura_estado ('insert','vbcostos','pendiente','PUPLAP',1,'{$tabla.prioridad_lb} = 3');
select wf.f_import_testructura_estado ('insert','vbcostos','pago_exterior','PUPLAP',1,'{$tabla.prioridad_lb} = 3');
select wf.f_import_testructura_estado ('insert','vb_jefe_aeropuerto','vbpoa','OPU',1,'');
select wf.f_import_testructura_estado ('insert','vb_jefe_trafico','vbfin','PUPLAP',1,'');
select wf.f_import_testructura_estado ('insert','borrador','liberacion','OPU',1,'');
select wf.f_import_testructura_estado ('insert','liberacion','registrado','OPU',1,'');
select wf.f_import_testructura_estado ('insert','borrador','vbconta','PU_ANT_PAR',1,'');
select wf.f_import_testructura_estado ('insert','borrador','vbconta','PUPLAP',1,'');
select wf.f_import_tfuncionario_tipo_estado ('insert','supconta','PUPLAP',NULL,NULL,NULL);
select wf.f_import_tfuncionario_tipo_estado ('insert','vbconta','PUPLAP',NULL,NULL,NULL);
select wf.f_import_tfuncionario_tipo_estado ('insert','liberacion','OPU','3497416','TES','');
select wf.f_import_tplantilla_correo ('insert','CORRFINPP','vbfin','PUPLAP','"{$tabla.tipo_obligacion}"="pago_directo" and "{$tabla.fecha_tentativa}">"05-09-2014"',' ','kbarrancos@boa.bo,cguzman@boa.bo',NULL);
select wf.f_import_tplantilla_correo ('insert','VBFINANREGU','vbfin','PUPLAP','"{$tabla.fecha_tentativa}">"05-09-2014"','','htapia@boa.bo',NULL);
select wf.f_import_tplantilla_correo ('insert','MAILVALIUSUOP','vbfin','PUPLAP','"{$tabla.desc_funcionario}"!="{$tabla.desc_usuario}" and "{$tabla.tipo_obligacion}"="pago_directo" and "{$tabla.fecha_tentativa}">"05-09-2014"','Señor {$tabla.desc_funcionario}:<br><br>El usuario <b>{$tabla.desc_usuario}</b>, realizó una solicitud de obligacion de pago directa con la siguiente información:<br><br>&nbsp; Proveedor :&nbsp; <b>{$tabla.desc_proveedor}</b><br>&nbsp;Monto :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>{$tabla.monto} {$tabla.codigo_moneda}</b><br><br>&nbsp;Detalle :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {$tabla.detalle}&nbsp;<br><br>{OBS}<br><br>Si requiere mayor información porfavor revise el sistema (módulo obligaciones de pago)<br><br>ERP BOA','{$tabla.email_empresa}',NULL);
----------------------------------
--COPY LINES TO SUBSYSTEM dependencies.sql FILE
---------------------------------

select wf.f_import_ttipo_documento_estado ('insert','FACTURA','OPU','borrador','OPU','crear','superior','');
select wf.f_import_ttipo_documento_estado ('insert','FACTURA','OPU','vbconta','PUPLAP','hacer_exigible','superior','');
select wf.f_import_ttipo_documento_estado ('insert','FACTURA','OPU','pendiente','PUPLAP','verificar','superior','');
select wf.f_import_ttipo_documento_estado ('insert','OTRDOC','PUPLAP','borrador','PUPLAP','crear','superior','');
select wf.f_import_ttipo_documento_estado ('insert','OTRO','PU_AP_ANT','borrador','PU_AP_ANT','crear','superior','');
select wf.f_import_ttipo_documento_estado ('insert','OTRO','PU_ANT_PAR','borrador','PU_ANT_PAR','crear','superior','');
select wf.f_import_ttipo_documento_estado ('insert','GARCON','OPU','borrador','OPU','crear','superior','');
select wf.f_import_ttipo_documento_estado ('insert','CONMOD','OPU','borrador','OPU','crear','superior','');
select wf.f_import_ttipo_documento_estado ('insert','ORDCAM','OPU','borrador','OPU','crear','superior','');
select wf.f_import_ttipo_documento_estado ('insert','SERV','OPU','borrador','OPU','crear','superior','{$tabla.id_proveedor} != 37260');
select wf.f_import_ttipo_proceso_origen ('insert','PU_AP_ANT','PU','TPLAP','pendiente','manual','');

/***********************************F-DAT-RCM-TES-0-09/10/2019*****************************************/