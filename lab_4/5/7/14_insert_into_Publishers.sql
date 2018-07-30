USE [Y_Naychuk_Library]
GO

SELECT * FROM Y_Naychuk_L.Publishers
SELECT * FROM Y_Naychuk_L.Authors_log

INSERT INTO [Y_Naychuk_L].[Publishers]

           (
           [Name]
           ,[URL]
		   )

 VALUES	  (
            'VV'
           ,'VV.com'
		   )
			,(
           'MegaPublisher'
           ,'mp.com'
		   )
			,(
           'abc'
           ,'abc.com'
		   )
           ,(
            'StaryjLev'
           ,'StaryjLev.com'
		   )

GO

SELECT * FROM Y_Naychuk_L.Publishers
SELECT * FROM Y_Naychuk_L.Authors_log
