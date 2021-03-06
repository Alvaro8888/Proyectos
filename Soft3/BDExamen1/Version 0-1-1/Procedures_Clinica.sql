USE [BD_ClinicaControl]
GO
/****** Object:  StoredProcedure [dbo].[usp_ActualizarCita]    Script Date: 25/04/2016 23:59:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Alvaro Siles Estrada
-- Create date: 20/04/2016
-- Description:	Actualizar la Cita
-- =============================================
CREATE PROCEDURE [dbo].[usp_ActualizarCita]
	@varfecha_hora varchar(50),
	@varObservacion	varchar(50),
	@intDoctorId	int,
	@intPacienteId	int,
	@intUsuarioId	int,
	@intCitaId	INT 

AS
BEGIN

	SET NOCOUNT ON;



UPDATE [DML].[Tbl_Cita]
   SET [fecha_hora] = @varfecha_hora
      ,[observacion] = @varObservacion
      ,[Fk_doctor_id] = @intDoctorId
      ,[Fk_paciente_id] = @intPacienteId
      ,[Fk_usuario_id] = @intUsuarioId

 WHERE cita_id=@intCitaId



END

GO
/****** Object:  StoredProcedure [dbo].[usp_ActualizarConsulta]    Script Date: 25/04/2016 23:59:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Alvaro Siles Estrada
-- Create date: 20/04/2016
-- Description:	Actualizar la Consulta
-- =============================================
CREATE PROCEDURE [dbo].[usp_ActualizarConsulta]
	@varfecha_hora varchar(50),
	@varObservacion	varchar(50),
	@varDiagnostico	varchar(50),
	@varEstudio	varchar(50),
	@varCitaId	int,
	@intConsultaId	INT 

AS
BEGIN

	SET NOCOUNT ON;


UPDATE [DML].[Tbl_Atencion_Consulta]
   SET [fechaHora] = @varfecha_hora
      ,[observacion] =@varObservacion
      ,[diagnostico] = @varDiagnostico
      ,[estudio] = @varEstudio
      ,[Fk_cita_id] = @varCitaId

 WHERE atencion_id=@intConsultaId



END

GO
/****** Object:  StoredProcedure [dbo].[usp_EliminarCita]    Script Date: 25/04/2016 23:59:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Alvaro Siles Estrada
-- Create date: 20/04/2016
-- Description:	Eliminar la Cita
-- =============================================
CREATE PROCEDURE [dbo].[usp_EliminarCita]
	@intCitaId	INT 

AS
BEGIN

	SET NOCOUNT ON;

DELETE FROM [DML].[Tbl_Cita]
      WHERE cita_id=@intCitaId

END

GO
/****** Object:  StoredProcedure [dbo].[usp_EliminarConsulta]    Script Date: 25/04/2016 23:59:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Alvaro Siles Estrada
-- Create date: 20/04/2016
-- Description:	Eliminar la Consulta
-- =============================================
CREATE PROCEDURE [dbo].[usp_EliminarConsulta]
	@intConsultaId	INT 

AS
BEGIN

	SET NOCOUNT ON;


DELETE FROM [DML].[Tbl_Atencion_Consulta]
      WHERE atencion_id= @intConsultaId

END

GO
/****** Object:  StoredProcedure [dbo].[usp_GetCita]    Script Date: 25/04/2016 23:59:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Alvaro Siles Estrada
-- Create date: 20/04/2016
-- Description:	Obtiene una lista de Atencion de Cita
-- =============================================
CREATE PROCEDURE [dbo].[usp_GetCita]
AS
BEGIN

	SET NOCOUNT ON;

SELECT [cita_id]
      ,[fecha_hora]
      ,[observacion]
      ,[Fk_doctor_id]
      ,[Fk_paciente_id]
      ,[Fk_usuario_id]
  FROM [DML].[Tbl_Cita]


END

GO
/****** Object:  StoredProcedure [dbo].[usp_GetCitaById]    Script Date: 25/04/2016 23:59:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Alvaro Siles Estrada
-- Create date: 20/04/2016
-- Description: seleccionar la cita por Id
-- =============================================
CREATE PROCEDURE [dbo].[usp_GetCitaById]
	@intCitaId	INT 

AS
BEGIN

	SET NOCOUNT ON;


SELECT [fecha_hora]
      ,[observacion]
      ,[Fk_doctor_id]
      ,[Fk_paciente_id]
      ,[Fk_usuario_id]
  FROM [DML].[Tbl_Cita]

      WHERE cita_id= @intCitaId

END

GO
/****** Object:  StoredProcedure [dbo].[usp_GetConsulta]    Script Date: 25/04/2016 23:59:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Alvaro Siles Estrada
-- Create date: 20/04/2016
-- Description:	Obtiene una lista de Atencion de Consulta
-- =============================================
CREATE PROCEDURE [dbo].[usp_GetConsulta]
AS
BEGIN

	SET NOCOUNT ON;

SELECT [atencion_id]
      ,[fechaHora]
      ,[observacion]
      ,[diagnostico]
      ,[estudio]
      ,[Fk_cita_id]
  FROM [DML].[Tbl_Atencion_Consulta]



END

GO
/****** Object:  StoredProcedure [dbo].[usp_GetConsultaById]    Script Date: 25/04/2016 23:59:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Alvaro Siles Estrada
-- Create date: 20/04/2016
-- Description: seleccionar la Consulta por Id
-- =============================================
CREATE PROCEDURE [dbo].[usp_GetConsultaById]
	@intConsultaId	INT 

AS
BEGIN

	SET NOCOUNT ON;

SELECT [fechaHora]
      ,[observacion]
      ,[diagnostico]
      ,[estudio]
      ,[Fk_cita_id]
  FROM [DML].[Tbl_Atencion_Consulta]


      WHERE atencion_id= @intConsultaId

END

GO
/****** Object:  StoredProcedure [dbo].[usp_InsertarCita]    Script Date: 25/04/2016 23:59:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Alvaro Siles Estrada
-- Create date: 20/04/2016
-- Description:	Insertar de Cita
-- =============================================
CREATE PROCEDURE [dbo].[usp_InsertarCita]
	@varfecha_hora varchar(50),
	@varObservacion	varchar(50),
	@intDoctorId	int,
	@intPacienteId	int,
	@intUsuarioId	int,
	@intCitaId	INT OUTPUT

AS
BEGIN

	SET NOCOUNT ON;


INSERT INTO [DML].[Tbl_Cita]
           ([fecha_hora]
           ,[observacion]
           ,[Fk_doctor_id]
           ,[Fk_paciente_id]
           ,[Fk_usuario_id])
     VALUES	(@varfecha_hora, @varObservacion, @intDoctorId, @intPacienteId, @intUsuarioId)

		   SET @intCitaId = SCOPE_IDENTITY()

END

GO
/****** Object:  StoredProcedure [dbo].[usp_InsertarConsulta]    Script Date: 25/04/2016 23:59:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Alvaro Siles Estrada
-- Create date: 20/04/2016
-- Description:	Insertar la Consulta
-- =============================================
CREATE PROCEDURE [dbo].[usp_InsertarConsulta]
	@varfecha_hora varchar(50),
	@varObservacion	varchar(50),
	@varDiagnostico	varchar(50),
	@varEstudio	varchar(50),
	@varCitaId	int,
	@intConsultaId	INT OUTPUT

AS
BEGIN

	SET NOCOUNT ON;


INSERT INTO [DML].[Tbl_Atencion_Consulta]
           ([fechaHora]
           ,[observacion]
           ,[diagnostico]
           ,[estudio]
           ,[Fk_cita_id])
     VALUES
           ( @varfecha_hora, @varObservacion,@varDiagnostico,@varEstudio,@varCitaId )


		   SET @intConsultaId = SCOPE_IDENTITY()

END

GO
/****** Object:  StoredProcedure [DML].[Drop_Permiso]    Script Date: 25/04/2016 23:59:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [DML].[Drop_Permiso]
@Permiso_id			int
AS
BEGIN
delete from [DML].[Tbl_Permiso]
WHERE Permiso_id = @Permiso_id;
end

GO
/****** Object:  StoredProcedure [DML].[Drop_PermisoUsr]    Script Date: 25/04/2016 23:59:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [DML].[Drop_PermisoUsr]
@PermisoUsr_id			int
AS
BEGIN
delete from [DML].[Tbl_PermisoUsuario]
WHERE PermisoUsr_id = @PermisoUsr_id;
end

GO
/****** Object:  StoredProcedure [DML].[Drop_Usuario]    Script Date: 25/04/2016 23:59:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [DML].[Drop_Usuario]
@Pk_tbl_Usuario			int
AS
BEGIN
delete from [DML].[Tbl_Usuario]
WHERE Usuario_id = @Pk_tbl_Usuario;
end

GO
/****** Object:  StoredProcedure [DML].[Ins_Permiso]    Script Date: 25/04/2016 23:59:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [DML].[Ins_Permiso]
@Permiso_id		int OUTPUT,
@nombrePermiso	varchar(50)

AS
BEGIN
INSERT INTO [DML].[Tbl_Permiso]         
values (@nombrePermiso)
SET @Permiso_id	 = SCOPE_IDENTITY();
select @Permiso_id = @@IDENTITY
END

GO
/****** Object:  StoredProcedure [DML].[Ins_PermisoUsr]    Script Date: 25/04/2016 23:59:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [DML].[Ins_PermisoUsr]
@PermisoUsr_id		int OUTPUT,
@Fk_permiso_id		int,
@Fk_usuario_id		int

AS
BEGIN
INSERT INTO [DML].[Tbl_PermisoUsuario]         
values (@Fk_permiso_id,@Fk_usuario_id)
SET @PermisoUsr_id	 = SCOPE_IDENTITY();
select @PermisoUsr_id = @@IDENTITY
END

GO
/****** Object:  StoredProcedure [DML].[Ins_Usuario]    Script Date: 25/04/2016 23:59:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [DML].[Ins_Usuario]
@Pk_tbl_Usuario			int OUTPUT,
@nombreCompleto			varchar(50),
@userName				varchar(50),
@password				varchar(50)

AS
BEGIN
INSERT INTO [DML].[Tbl_Usuario]         
values (@nombreCompleto,@userName,@password)
SET @Pk_tbl_Usuario	 = SCOPE_IDENTITY();
select @Pk_tbl_Usuario = @@IDENTITY
END

GO
/****** Object:  StoredProcedure [DML].[Select_Permiso]    Script Date: 25/04/2016 23:59:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [DML].[Select_Permiso]
AS
BEGIN
SELECT        *
FROM           [DML].[Tbl_Permiso]
END

GO
/****** Object:  StoredProcedure [DML].[Select_PermisoUsr]    Script Date: 25/04/2016 23:59:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [DML].[Select_PermisoUsr]
AS
BEGIN
SELECT        *
FROM           [DML].[Tbl_PermisoUsuario]
END

GO
/****** Object:  StoredProcedure [DML].[Select_Usuario]    Script Date: 25/04/2016 23:59:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [DML].[Select_Usuario]
AS
BEGIN
SELECT        *
FROM           [DML].[Tbl_Usuario]
END

GO
/****** Object:  StoredProcedure [DML].[Upd_Permiso]    Script Date: 25/04/2016 23:59:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [DML].[Upd_Permiso]
@Permiso_id		int OUTPUT,
@nombrePermiso	varchar(50)
as
begin
update [DML].[Tbl_Permiso] set nombrePermiso = @nombrePermiso
where  Permiso_id= @Permiso_id ;
end

GO
/****** Object:  StoredProcedure [DML].[Upd_PermisoUsr]    Script Date: 25/04/2016 23:59:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [DML].[Upd_PermisoUsr]
@PermisoUsr_id		int,
@Fk_permiso_id		int,
@Fk_usuario_id		int
as
begin
update [DML].[Tbl_PermisoUsuario] set Fk_permiso_id = @Fk_permiso_id, Fk_usuario_id = @Fk_usuario_id
where  PermisoUsr_id= @PermisoUsr_id ;
end

GO
/****** Object:  StoredProcedure [DML].[Upd_Usuario]    Script Date: 25/04/2016 23:59:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [DML].[Upd_Usuario]
@Pk_tbl_Usuario			int,
@nombreCompleto			varchar(50),
@userName				varchar(50),
@password				varchar(50)
as
begin
update [DML].[Tbl_Usuario] set nombreCompleto = @nombreCompleto, userName = @userName, password = @password
where  Usuario_id = @Pk_tbl_Usuario;
end

GO
