CREATE DATABASE MP;

USE MP;

CREATE TABLE FISCALIA(
	idFiscalia INT PRIMARY KEY IDENTITY(1,1),
	nombre NVARCHAR(255) NOT NULL,
	direccion NVARCHAR(255) NOT NULL,
	telefono NVARCHAR(25) NOT NULL
);

--DBCC CHECKIDENT('MP.dbo.FISCALIA', RESEED, 0);

CREATE PROCEDURE insertarFiscalia(
	@nombre NVARCHAR(255),
	@direccion NVARCHAR(255),
	@telefono NVARCHAR(25)
)
As
	INSERT INTO FISCALIA (nombre, direccion, telefono)
	VALUES (@nombre,@direccion,@telefono)
go

CREATE PROCEDURE listarFiscalias
As
	SELECT F.idFiscalia, F.nombre, F.direccion, F.telefono
	FROM FISCALIA As F
go

CREATE PROCEDURE modificarDireccionFiscalia(
	@idFiscalia INT,
	@direccion NVARCHAR(255)
)
As
	UPDATE FISCALIA 
	SET direccion = @direccion
	WHERE idFiscalia = @idFiscalia
go

CREATE PROCEDURE modificarNombreFiscalia(
	@idFiscalia INT,
	@nombre NVARCHAR(255)
)
As
	UPDATE FISCALIA 
	SET nombre = @nombre
	WHERE idFiscalia = @idFiscalia
go

CREATE PROCEDURE modificarTelefonoFiscalia(
	@idFiscalia INT,
	@telefono NVARCHAR(25)
)
As
	UPDATE FISCALIA 
	SET telefono = @telefono
	WHERE idFiscalia = @idFiscalia
go

CREATE PROCEDURE eliminarFiscalia(
	@idFiscalia INT
)
As
	DELETE FROM FISCALIA 
	WHERE idFiscalia = @idFiscalia
go

CREATE PROCEDURE modificarFiscalia(
	@idFiscalia INT,
	@nombre NVARCHAR(255) = NULL,
	@direccion NVARCHAR(255) = NULL,
	@telefono NVARCHAR(25) = NULL
)
As
	IF @nombre IS NOT NULL 
		UPDATE FISCALIA 
		SET nombre = @nombre
		WHERE idFiscalia = @idFiscalia
	IF @direccion IS NOT NULL 
		UPDATE FISCALIA 
		SET direccion = @direccion
		WHERE idFiscalia = @idFiscalia
	IF @telefono IS NOT NULL 
		UPDATE FISCALIA 
		SET telefono = @telefono
		WHERE idFiscalia = @idFiscalia
	
go

CREATE PROCEDURE buscarFiscalia(
	@idFiscalia INT
)
As
	Select * FROM FISCALIA 
	WHERE idFiscalia = @idFiscalia
go


SELECT * FROM FISCALIA;

EXECUTE insertarFiscalia "Fiscalia zona 2","1 calle 12-28, zona 2, Guatemala", "+502 23430000"

execute listarFiscalias

execute buscarFiscalia 2