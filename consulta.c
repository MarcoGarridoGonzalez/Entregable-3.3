#include <stdio.h>
#include <mysql.h>
#include <string.h>
#include <stdlib.h>

int main(int argc, char **argv)
{
	MYSQL *conn;
	int err;
	MYSQL_RES *resultado;
	MYSQL_ROW;
	conn = mysql_init(NULL);
	if (conn = NULL){
		printf ("Error al crear la conexion: %u %s\n", mysql_errno(conn), mysql_error(conn));
		exit (1);
	}
	conn = mysql_real_connect (conn,"localhost","root", "mysql", "bbdd",0,NULL,0);
	char fecha[20];
	printf("Que fecha quieres buscar\n");
	scanf("%s", fecha);
	char consulta[80];
	strcpy (consulta, "Select jugador.username FROM jugador,partida,informacion WHERE partida.fecha = '");
	strcat (consulta,fecha);
	strcat (consulta, "'AND partida.id = informacion.id_p AND informacion.id_ganador = jugador.id");
	err = mysql_query (conn, consulta);
	if (err! = 0) {
		printf ("Error al consultar datos de la base %u %s\n", mysql_errno(conn), mysql_errno(conn));
		exit (1);
	}
	resultado = mysql_store_result (conn);
	row = mysql_fetch_row (resultado);
	while (row !=NULL){
		printf("%s\n", row[1]);
		row = mysql_fetch_row(resultado);
	}
	
	mysql_close (conn);
	exit(0);
}

