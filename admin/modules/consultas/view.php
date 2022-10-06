 
  <!-- Main content -->
 
    
    
                               <div class="row" style="margin-bottom: 20px">
                <div class="col-md-12">
                  <div class="card">
                        <div class="card-action">
                             Resultado:
                        </div>
                        <div class="card-content">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>
                                            
                  <?php
                  
                  if($_GET['c']==1){
                    ?>
                                        <th>Codigo Factura</th>
                                            <th>Reserva</th>
                                            <th>Estado Reserva</th>
                                            <th>Nombres</th>
                                            <th>Apellidos</th>
                                            <th>Metodo Pago</th>
                                            <th>Valor Total</th>
                                            <th>Fecha Factura</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                    <?php
                    $sql = mysqli_query($mysqli, "SELECT F.cod_fc as Codigo_Factura, R.cod_r as Reserva, R.estado_reserva as Estado_Reserva, H.nombres as Nombres, H.apellidos as Apellidos, M.nombre_met  as Metodo_de_Pago, F.valor_total  as Valor_Total, F.fecha_fc as Fecha_Factura
from t_factura as F 
INNER JOIN t_reservas as R ON (F.fk_cod_r=R.cod_r)
INNER JOIN t_huespedes as H ON(R.fk_nro_ident=H.nro_ident)
INNER JOIN t_metodo_pago as M ON (F.fk_cod_met=M.cod_met)
WHERE R.estado_reserva='CON'
ORDER BY F.valor_total DESC;
")
                                          or die('Error : '.mysqli_error($mysqli));
                     while($row = mysqli_fetch_array($sql)) {
                      echo '<tr class="odd gradeX">';
                      for($i=0; $i<=7;$i++){
                        echo '<td>'.$row[$i].'</td>';
                      }
                      echo '</tr>';
                      

                    }

                     mysqli_free_result($sql);
                  }

                  ?>


                  <?php
                  
                  if($_GET['c']==2){
                    ?>
                                        <th>Codigo Producto</th>
                                            <th>Nombre Producto</th>
                                            <th>Cantidad Vendida</th>
                                            <th>Nombre Proveedor</th>
                                            <th>Fecha Venta</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                    <?php
                    $sql = mysqli_query($mysqli, "SELECT  F.fk_cod_prod as Codigo_Producto, P.nombr_prod as Nombre_Producto, F.cantidad_pf as Cantidad_Vendida, O.nombre_pv as Nombre_Proveedor, F.fecha_pf as Fecha_Compra
FROM t_productos_factura F
INNER JOIN t_productos P
ON(F.fk_cod_prod=P.cod_prod)
INNER JOIN t_proveedores O
ON(P.fk_codigo_pv=O.codigo_pv)
ORDER BY F.cantidad_pf ASC;
")
                                          or die('Error : '.mysqli_error($mysqli));
                     while($row = mysqli_fetch_array($sql)) {
                      echo '<tr class="odd gradeX">';
                      for($i=0; $i<=4;$i++){
                        echo '<td>'.$row[$i].'</td>';
                      }
                      echo '</tr>';
                      

                    }

                     mysqli_free_result($sql);
                  }

                  if($_GET['c']==3){
                    ?>
                                        <th>Estado Reserva</th>
                                            <th>Procedencia Huésped</th>
                                            <th>Nombre Paquete</th>
                                            <th>Nombre Temporada</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                    <?php
                    $sql = mysqli_query($mysqli, "SELECT R.estado_reserva as Estado_Reserva, H.lugar_origen as Lugar_Origen, P.nomb_pq as Nombre_Paquete, T.nomb_tem as Nombre_Temporada
FROM t_reservas R
INNER JOIN t_huespedes H
ON(R.fk_nro_ident=H.nro_ident)
INNER JOIN t_paquetes P
ON(R.fk_cod_paq=P.cod_paq)
INNER JOIN t_temporadas T
ON(P.fk_cod_tem=T.cod_tem)
ORDER BY R.estado_reserva;

")
                                          or die('Error : '.mysqli_error($mysqli));
                     while($row = mysqli_fetch_array($sql)) {
                      echo '<tr class="odd gradeX">';
                      for($i=0; $i<=3;$i++){
                        echo '<td>'.$row[$i].'</td>';
                      }
                      echo '</tr>';
                      

                    }

                     mysqli_free_result($sql);
                  }

                  if($_GET['c']==4){
                    ?>
                                        <th>Codigo Paquete</th>
                                            <th>Nombre Paquete</th>
                                            <th>Ventas Totales</th>
                                            <th>Temporada</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                    <?php
                    $sql = mysqli_query($mysqli, "SELECT P.cod_paq as Codigo_paquete, P.nomb_pq as Nombre_Paquete, SUM(F.valor_total) as Ventas_Totales, T.nomb_tem as Temporada FROM t_factura as F
INNER JOIN t_reservas as R ON(F.fk_cod_r=R.cod_r)
INNER JOIN t_paquetes as P ON(R.fk_cod_paq=P.cod_paq)
INNER JOIN t_temporadas as T ON(P.fk_nomb_tem=T.nomb_tem)
WHERE R.estado_reserva='CON'
GROUP BY R.fk_cod_paq;


")
                                          or die('Error : '.mysqli_error($mysqli));
                     while($row = mysqli_fetch_array($sql)) {
                      echo '<tr class="odd gradeX">';
                      for($i=0; $i<=3;$i++){
                        echo '<td>'.$row[$i].'</td>';
                      }
                      echo '</tr>';
                      

                    }

                     mysqli_free_result($sql);
                  }

                  if($_GET['c']==5){
                    ?>
                                        <th>Codigo Factura</th>
                                            <th>Nombres</th>
                                            <th>Apellidos</th>
                                            <th>Cantidad Habitaciones</th>
                                            <th>Cantidad Productos</th>
                                            <th>Cantidad Comidas</th>
                                            <th>Cantidad Actividades</th>
                                            <th>Valor Total</th>
                                            <th>Fecha Factura</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                    <?php
                    $sql = mysqli_query($mysqli, "SELECT F.cod_fc as Codigo_Factura,H.nombres as Nombres, H.apellidos as Apellidos, count(HAB.id_hab_fc) as Cantidad_Habitaciones, SUM(P.cantidad_pf) as Cantidad_Productos, count(C.id_com_fc) as Cantidad_Comidas, count(A.id_act_fc) as Cantidad_Actividades, F.valor_total as Valor_Total,  F.fecha_fc as Fecha_Factura from t_factura as F
INNER JOIN t_habitaciones_factura as HAB ON (F.cod_fc=HAB.fk_cod_fc)
INNER JOIN t_productos_factura as P ON (F.cod_fc=P.fk_cod_fc)
INNER JOIN t_comidas_factura as C ON (F.cod_fc=C.fk_cod_fc)
INNER JOIN t_actividades_factura as A ON (F.cod_fc=A.fk_cod_fc)
LEFT JOIN t_reservas as R ON (F.fk_cod_r=R.cod_r)
INNER JOIN t_huespedes as H ON(R.fk_nro_ident=H.nro_ident)
GROUP BY F.cod_fc, A.fk_cod_fc;

")
                                          or die('Error : '.mysqli_error($mysqli));
                     while($row = mysqli_fetch_array($sql)) {
                      echo '<tr class="odd gradeX">';
                      for($i=0; $i<=8;$i++){
                        echo '<td>'.$row[$i].'</td>';
                      }
                      echo '</tr>';
                      

                    }

                     mysqli_free_result($sql);
                  }


                  if($_GET['c']==6){
                    ?>
                                        <th>Nombre paquete</th>
                                            <th>Identificación Huésped</th>
                                            <th>Nombres Huésped</th>
                                            <th>Apellidos Huésped</th>
                                            <th>Días Hospedaje</th>
                                            <th>Correo Electrónico</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                    <?php
                    $sql = mysqli_query($mysqli, "SELECT P.nomb_pq as Nombre_Paquete, H.nro_ident as Identificacion_Huesped, H.nombres as Nombres_Huesped, H.apellidos as Apellidos_Huesped, R.dias_hospedaje as Dias_Hospedaje, H.correo_elec as Correo_Electronico
FROM t_reservas as R
INNER JOIN t_huespedes as H ON(R.fk_nro_ident=H.nro_ident)
RIGHT JOIN t_paquetes as P ON(R.fk_cod_paq=P.cod_paq)
WHERE R.dias_hospedaje>=5
ORDER BY H.nro_ident AND R.dias_hospedaje;


")
                                          or die('Error : '.mysqli_error($mysqli));
                     while($row = mysqli_fetch_array($sql)) {
                      echo '<tr class="odd gradeX">';
                      for($i=0; $i<=5;$i++){
                        echo '<td>'.$row[$i].'</td>';
                      }
                      echo '</tr>';
                      

                    }

                     mysqli_free_result($sql);
                  }

                  if($_GET['c']==7){
                    ?>
                                        <th>Nombre Huésped</th>
                                            <th>Número Habitación</th>
                                            <th>Disponibilidad</th>
                                            <th>Tipo Habitación</th>
                                            <th>Tipo Cama</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                    <?php
                    $sql = mysqli_query($mysqli, "SELECT U.nombres as Nombre_Huesped, H.nro_hab as Numero_Habitacion, H.dispon as Disponibilidad,  T.nom_th as Nombre_Tipo_Habitacion, C.tipo_c as Tipo_Cama 
from t_camas as C
INNER JOIN t_habitaciones as H ON (C.fk_nro_hab=H.nro_hab)
INNER JOIN t_tipo_hab as T ON(H.fk_cod_th=T.cod_th)
INNER JOIN t_habitaciones_factura HA ON(HA.fk_nro_hab=H.nro_hab)
INNER JOIN t_factura as F ON(HA.fk_cod_fc=F.cod_fc)
INNER JOIN t_huespedes as U ON(F.fk_nro_ident=U.nro_ident)
WHERE H.dispon='ND'
ORDER BY C.tipo_c;


")
                                          or die('Error : '.mysqli_error($mysqli));
                     while($row = mysqli_fetch_array($sql)) {
                      echo '<tr class="odd gradeX">';
                      for($i=0; $i<=4;$i++){
                        echo '<td>'.$row[$i].'</td>';
                      }
                      echo '</tr>';
                      

                    }

                     mysqli_free_result($sql);
                  }




                  ?>
                    <!-- Advanced Tables -->
                    
                                    
                                        
                                    </tbody>
                                </table>
                            </div>
                            
                        </div>
                    </div>
                    <!--End Advanced Tables -->
                </div>
            </div>
            </div>
    </div>
 </div> 
     </div>     
              
                           
        </div>

       
      </div>
       </div>
</section>
 
			 
                <!-- /.col-lg-12 --> 
		
    
 


