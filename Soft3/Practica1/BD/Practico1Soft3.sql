USE [Practico1Soft3]
GO
/****** Object:  Table [dbo].[tbl_Clientes]    Script Date: 08/04/2016 18:58:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Clientes](
	[cliente_id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[nit] [varchar](50) NULL,
 CONSTRAINT [PK_tbl_Clientes] PRIMARY KEY CLUSTERED 
(
	[cliente_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Producto]    Script Date: 08/04/2016 18:58:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Producto](
	[producto_id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[precio] [varchar](50) NULL,
 CONSTRAINT [PK_tbl_Producto] PRIMARY KEY CLUSTERED 
(
	[producto_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_ActualizarCliente]    Script Date: 08/04/2016 18:58:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Alvaro Siles Estrada
-- Create date: 7/03/2016
-- Description:	Actualiza un Cliente
-- =============================================
CREATE PROCEDURE [dbo].[usp_ActualizarCliente]
	@varNombre	VARCHAR(50),
	@varNit	VARCHAR(50),
	@intClienteId	INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    UPDATE tbl_Clientes
	   SET [nombre] = @varNombre
		  ,nit = @varNit
	 WHERE cliente_id = @intClienteId
    
    
END


GO
/****** Object:  StoredProcedure [dbo].[usp_ActualizarProducto]    Script Date: 08/04/2016 18:58:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Alvaro Siles Estrada
-- Create date: 7/03/2016
-- Description:	Actualiza un Producto
-- =============================================
CREATE  PROCEDURE [dbo].[usp_ActualizarProducto]
	@varNombre	VARCHAR(50),
	@varPrecio	VARCHAR(50),
	@intProductoId	INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    UPDATE tbl_Producto
	   SET [nombre] = @varNombre
		  ,precio = @varPrecio
	 WHERE producto_id = @intProductoId
    
    
END



GO
/****** Object:  StoredProcedure [dbo].[usp_BuscarCliente]    Script Date: 08/04/2016 18:58:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Alvaro Siles Estrada
-- Create date: 7/03/2016
-- Description:	Buscar por Nit de clientes
-- =============================================
create PROCEDURE [dbo].[usp_BuscarCliente]
@varNit	VARCHAR(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT *
	FROM tbl_Clientes
	where nit like @varNit +'%'
    
    
END

GO
/****** Object:  StoredProcedure [dbo].[usp_EliminarCliente]    Script Date: 08/04/2016 18:58:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Alvaro Siles Estrada
-- Create date: 7/03/2016
-- Description:	Elimnar un Cliente
-- =============================================
CREATE PROCEDURE [dbo].[usp_EliminarCliente]
	@intClienteId 	INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


	delete	FROM tbl_Clientes
	WHERE cliente_id = @intClienteId
    
    
END


GO
/****** Object:  StoredProcedure [dbo].[usp_EliminarProducto]    Script Date: 08/04/2016 18:58:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Alvaro Siles Estrada
-- Create date: 7/03/2016
-- Description:	Elimina un producto
-- =============================================
CREATE PROCEDURE [dbo].[usp_EliminarProducto]
	@intProducto_id 	INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


	delete FROM tbl_Producto
	WHERE producto_id = @intProducto_id
    
    
END


GO
/****** Object:  StoredProcedure [dbo].[usp_GetCliente]    Script Date: 08/04/2016 18:58:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Alvaro Siles Estrada
-- Create date: 7/03/2016
-- Description:	Obtiene una lista de clientes
-- =============================================
CREATE PROCEDURE [dbo].[usp_GetCliente]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT cliente_id,
		nombre,
		nit
	FROM tbl_Clientes
    
    
END


GO
/****** Object:  StoredProcedure [dbo].[usp_GetClienteById]    Script Date: 08/04/2016 18:58:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Alvaro Siles Estrada
-- Create date: 7/03/2016
-- Description:	Obtiene un cliente por ID
-- =============================================
CREATE PROCEDURE [dbo].[usp_GetClienteById]
	@intClienteId 	INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT nombre,
		nit
	FROM tbl_Clientes
	WHERE cliente_id = @intClienteId
    
    
END


GO
/****** Object:  StoredProcedure [dbo].[usp_GetProducto]    Script Date: 08/04/2016 18:58:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Alvaro Siles Estrada
-- Create date: 7/03/2016
-- Description:	Obtiene una lista de productos
-- =============================================
CREATE PROCEDURE [dbo].[usp_GetProducto]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT producto_id,
		nombre,
		precio
	FROM tbl_Producto
    
    
END


GO
/****** Object:  StoredProcedure [dbo].[usp_GetProductoById]    Script Date: 08/04/2016 18:58:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Alvaro Siles Estrada
-- Create date: 7/03/2016
-- Description:	Obtiene un produucto por ID
-- =============================================
CREATE PROCEDURE [dbo].[usp_GetProductoById]
	@intProducto_id 	INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT nombre,
		precio
	FROM tbl_Producto
	WHERE producto_id = @intProducto_id
    
    
END


GO
/****** Object:  StoredProcedure [dbo].[usp_InsertarCliente]    Script Date: 08/04/2016 18:58:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Alvaro Siles Estrada
-- Create date: 7/03/2016
-- Description:	Insertar un Cliente
-- =============================================
CREATE PROCEDURE [dbo].[usp_InsertarCliente]
	@varNombre	VARCHAR(50),
	@varNit	VARCHAR(50),
	@intClienteId	INT OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    INSERT INTO tbl_Clientes
           (nombre,nit)
     VALUES
           (@varNombre,@varNit )
           
	SET @intClienteId = SCOPE_IDENTITY()

END

GO
/****** Object:  StoredProcedure [dbo].[usp_InsertarProducto]    Script Date: 08/04/2016 18:58:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Alvaro Siles Estrada
-- Create date: 7/03/2016
-- Description:	Insertar un producto
-- =============================================
CREATE PROCEDURE [dbo].[usp_InsertarProducto]
	@varNombre	VARCHAR(50),
	@varPrecio	VARCHAR(50),
	@intProductoId	INT OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    INSERT INTO tbl_Producto
           (nombre,precio)
     VALUES
           (@varNombre,@varPrecio )
           
	SET @intProductoId = SCOPE_IDENTITY()

END

GO
