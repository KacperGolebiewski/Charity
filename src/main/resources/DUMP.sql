CREATE DATABASE  IF NOT EXISTS `charity_donation` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
-- MySQL dump 10.13  Distrib 8.0.30, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: charity_donation
-- ------------------------------------------------------
-- Server version	8.0.30-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
# /*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `app_user`
--

DROP TABLE IF EXISTS `app_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_user` (
                            `id` bigint NOT NULL AUTO_INCREMENT,
                            `app_user_role` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                            `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                            `enabled` bit(1) DEFAULT NULL,
                            `first_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                            `last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                            `locked` bit(1) DEFAULT NULL,
                            `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                            PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=308 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_user`
--

LOCK TABLES `app_user` WRITE;
/*!40000 ALTER TABLE `app_user` DISABLE KEYS */;
INSERT INTO `app_user` VALUES (1,'ROLE_ADMIN','admin@admin.com',_binary '','admin','admin',_binary '\0','$2a$10$jCwbUhvQnIx2SrADrUj4XeThbbugpdaO8xe4u1FAccuSGWdKmJ2BC'),(8,'ROLE_USER','sang.kirlin@gmail.com',_binary '\0','Chad','Lesch',_binary '\0','$2a$10$3i5lEPZ.M37xxm79eQN8B.uwfPLAsklWOqkZw0OEwO5GSWDAHCMk6'),(9,'ROLE_USER','elinore.willms@gmail.com',_binary '\0','Junior','Ryan',_binary '\0','$2a$10$sGKD/05YF.Gaj3kRwyUYHe/aH5PH6ap1Zd5aA4QGNy4xBzNLzX2kq'),(11,'ROLE_USER','jamie.schulist@hotmail.com',_binary '\0','Golden','Rosenbaum',_binary '\0','$2a$10$UiF/I8mDDN1JIPhlZXl4O.uMmlfoOZr2Ik1zPzU/nroPb05tWCvSS'),(12,'ROLE_USER','delcie.rohan@hotmail.com',_binary '\0','Gene','Schneider',_binary '\0','$2a$10$lt1OWUKARE05rqpEgju3Gux/zxkcamyYaHpDL598zAEq.922c4/L2'),(14,'ROLE_USER','elvis.simonis@hotmail.com',_binary '\0','Graham','Yundt',_binary '\0','$2a$10$O7f8NhuRQutrx.tyA4mXqepjZx2hHVpCiIC4hDE1R2x3ag68qzx7C'),(15,'ROLE_USER','ronnie.bailey@hotmail.com',_binary '\0','Georgetta','Kirlin',_binary '\0','$2a$10$OpeB//s0Gu/A4UH5SBTj8u0tHP4/o41123b3fcXLksXjXKPU6aDuu'),(16,'ROLE_USER','marian.lind@hotmail.com',_binary '\0','Mario','Orn',_binary '\0','$2a$10$SP6HUph94wjA4KqsE7o3/u6De.SMuCd5gK51rTT5vstApN5MtQ4Je'),(17,'ROLE_USER','rossie.gislason@hotmail.com',_binary '\0','Jaclyn','Parisian',_binary '\0','$2a$10$P49f6vts/tZ29xZtHPWjLejDPTAed9gDzLwVJ.WmUTP6r/XZsTBIi'),(18,'ROLE_USER','hai.herzog@hotmail.com',_binary '\0','Christine','Bernhard',_binary '\0','$2a$10$Lsz6FfAEfCPlEyYt7zjhu.Rwxw5Q7SF0pVhaIsOpdmGjVaY0/5QYi'),(19,'ROLE_USER','lachelle.rau@hotmail.com',_binary '\0','Ellis','Ullrich',_binary '\0','$2a$10$qWg7XwIS54nYKZEZ5iy9Uuax9LLl9RZ5hxOLbrNDDnfIBbG8jXNDS'),(20,'ROLE_USER','marica.schaden@gmail.com',_binary '\0','Olinda','Wiza',_binary '\0','$2a$10$EcSh/3QsTOhOkpOuV7OO/uCt5CJdtFYibzkjI0eNrjnIB0n0nIvau'),(21,'ROLE_USER','tami.stiedemann@hotmail.com',_binary '\0','Shemeka','Waelchi',_binary '\0','$2a$10$2IrQyha/muJnG7SRVhbHxurcNHZWDGameMRGSdpPQAsZsxEMiKMrO'),(22,'ROLE_USER','mitsue.simonis@gmail.com',_binary '\0','Lee','Harber',_binary '\0','$2a$10$P6N1PEm6rJUNOo.ZvAKMpuVPN3/N8czmxemtRvK7B.L.rh7akB7S2'),(23,'ROLE_USER','nicolas.lueilwitz@hotmail.com',_binary '\0','Shayne','Gottlieb',_binary '\0','$2a$10$zWhRqKPWtTu2jAXD/QrhZecOUPeRmozQxy1o0s9hT/lbjk7wVfyb.'),(24,'ROLE_USER','guy.daniel@yahoo.com',_binary '\0','Russell','Roob',_binary '\0','$2a$10$S9qh8XkXTsZBh5VhD12rLOjo1A7ziftUZ8TKqBBGKCXOz9oUVgM2S'),(26,'ROLE_USER','roderick.gleichner@yahoo.com',_binary '\0','Lowell','Feil',_binary '\0','$2a$10$DJteHi7cdcOZp22CFZvt8OenZZODW07tY.6gFsQ5EwGe7k3y.MWDG'),(27,'ROLE_USER','marlo.dubuque@gmail.com',_binary '\0','Samuel','Durgan',_binary '\0','$2a$10$r17wEtjMjyMCmU2r7t/zvO4TjPSs9a4jGmzyMUNw4xFP75x..kPUu'),(29,'ROLE_USER','juan.becker@yahoo.com',_binary '\0','Jules','Watsica',_binary '\0','$2a$10$wDo0OTmXJPCHROEXepuUIu/QNVR6C2P9DmaHAwVMF3OVWFldJj/HK'),(30,'ROLE_USER','douglas.paucek@yahoo.com',_binary '\0','Lisa','Muller',_binary '\0','$2a$10$g00WQQOEYlOI5LeIemdJQ.JPtg0J4OYsu69hhrz.W27I21t9Ftw4W'),(31,'ROLE_USER','eldon.jakubowski@hotmail.com',_binary '\0','Lavina','Gaylord',_binary '\0','$2a$10$sbnhHNp2ycE9NqxxxhJI.Oum0YcvH0Uk4VjyLrls206GhbF0kbcbW'),(32,'ROLE_USER','masako.shields@yahoo.com',_binary '\0','Hassan','Feeney',_binary '\0','$2a$10$T.mTOWHwW10jzlKacNk/t.UjKVLso6R9giMgOEpjiYCKb4Ra22fC.'),(33,'ROLE_USER','terina.kozey@hotmail.com',_binary '\0','Deloris','Blick',_binary '\0','$2a$10$Eq2I1cibWh8JWFJXjol5Gu1scaRnLumBHZYrfz57tzErlRVdQom.a'),(34,'ROLE_USER','hassan.blick@yahoo.com',_binary '\0','Cornell','Rowe',_binary '\0','$2a$10$OrBIb9pbPbP/e4qat03hfuhfu4j8YkAE9iG1ZnEj5O1L013/s5gei'),(35,'ROLE_USER','doria.morissette@hotmail.com',_binary '\0','Frank','Sawayn',_binary '\0','$2a$10$NkN/7h/d/TVaNzQNPK55t.nVA/MqfGM5zQuHn/ExZj1mVs6viK6/G'),(36,'ROLE_USER','josh.altenwerth@gmail.com',_binary '\0','Kiley','Hilll',_binary '\0','$2a$10$LhB2L2l53qvWHOm72fT9XO.OO66HTXDAu37r3pbxTzzsVOF/.VPim'),(37,'ROLE_USER','deidra.dare@hotmail.com',_binary '\0','Kam','Kohler',_binary '\0','$2a$10$Sd.sjKWMW51sM6WSadSef.hw.bG1FOoaEmpS/KBbTKZXsMbVRZlPW'),(38,'ROLE_USER','stanford.monahan@gmail.com',_binary '\0','Jacquelin','Predovic',_binary '\0','$2a$10$Pog.RrEZR4/92PtZ1XBmIOvnYO2EqLCL1r46yuO4hg4pZkDD2Lnfe'),(39,'ROLE_USER','miss.rice@gmail.com',_binary '\0','Selina','Sipes',_binary '\0','$2a$10$MzHCkpN.HBUIYexYOS2VXuU/cu02PgZYeRVxIf/LloZXM86Ywk/wi'),(41,'ROLE_USER','arlen.dicki@gmail.com',_binary '\0','Oleta','Fisher',_binary '\0','$2a$10$2uEw1qf5dr5IRclTZBQ0Tu4iHG2Zr7fP7REgZTmsa3vzttOSp19fG'),(42,'ROLE_USER','bennie.ondricka@yahoo.com',_binary '\0','Clyde','Mraz',_binary '\0','$2a$10$ekNRgw3ToXj2cxfyxxKv7.OQVUHghpKaIGEVAzHElJkwa3MEowJX2'),(43,'ROLE_USER','denis.sawayn@hotmail.com',_binary '\0','Wayne','Leuschke',_binary '\0','$2a$10$EnQBBw84WF0i8XLWl5qsjuCUKMXTbyY0JkwWtIDPB56l0bE8H8mmK'),(44,'ROLE_USER','marcelo.sipes@gmail.com',_binary '\0','Mina','McGlynn',_binary '\0','$2a$10$M.lQPZ.iV/qEsUddLFT2Y.lPVuIr7edlo4DcwmqEXQD0ByBDTJU2u'),(45,'ROLE_USER','omer.tromp@hotmail.com',_binary '\0','Javier','Lang',_binary '\0','$2a$10$YqQP/hDEYdoIosIIhUkeAORgMjgmp.k6yPX0zn2lRXnWxIiCfuoIy'),(47,'ROLE_USER','toney.davis@gmail.com',_binary '\0','Thaddeus','Terry',_binary '\0','$2a$10$9NgGE7oi/XIBc/B.kwWhD.GJc1WKM7HqsrmOrug1mrxgo8ytV.tw2'),(48,'ROLE_USER','maribeth.kautzer@yahoo.com',_binary '\0','Trevor','Dach',_binary '\0','$2a$10$Bit.MRwRLkhf69ASLL.o4umpuY.6NPuREh95yOdKccZJpBnCRxuoi'),(49,'ROLE_USER','walker.streich@gmail.com',_binary '\0','Roderick','Bergnaum',_binary '\0','$2a$10$kqAaUvxMj6YguBLn6Z.C7ePLY44nV4PUrlCB7TdEmcKKNbG2IxMla'),(51,'ROLE_USER','erick.toy@gmail.com',_binary '\0','Leonel','Russel',_binary '\0','$2a$10$ZUemadmjjPjTgrRnjtlrouIRc4fxD9QWRYAv4INx2m4iDC87/P/4S'),(52,'ROLE_USER','henry.maggio@gmail.com',_binary '\0','Yun','Gibson',_binary '\0','$2a$10$MsXeIDd3gsYwaazsba/8AeS/Fcqx9vKt2X0t.ZRzfgrQcnSOIcgZC'),(53,'ROLE_USER','alfonso.weber@yahoo.com',_binary '\0','Cher','Okuneva',_binary '\0','$2a$10$1twuqL3vf04rgli/xvmv6eGPqMSIROA2L.Qknjt4IkyO22/0wKjWS'),(55,'ROLE_USER','dannielle.tromp@yahoo.com',_binary '\0','Indira','Leffler',_binary '\0','$2a$10$vWlLLBo9k/I14SYPjJNel.6KCKimKvWtNCnMp0kvjgnzMLULF.QO2'),(56,'ROLE_USER','jess.willms@gmail.com',_binary '\0','Millard','Schneider',_binary '\0','$2a$10$rAXxGsZ3U3zoygCjkc2t8eDSuxr14bBWDvKRk2ocqQbJgpv8vkRkG'),(58,'ROLE_USER','mikaela.jenkins@hotmail.com',_binary '\0','Marcelo','Bogisich',_binary '\0','$2a$10$oGmdj1N8jrrqYCKTczpU4O8k8m.rwSpCwiw.hMjdE0m1yJHbBAch2'),(59,'ROLE_USER','chance.carter@gmail.com',_binary '\0','Giuseppe','Stoltenberg',_binary '\0','$2a$10$0g781WOofyXfs7s7SCUkE.IrMzz0PdDIfWzBqmVKN2GskdzzaZ4PW'),(60,'ROLE_USER','lavinia.douglas@yahoo.com',_binary '\0','Pura','Tillman',_binary '\0','$2a$10$oEqp2CCOmB0d6rGtLvN6aecuIKwjt3Lo1oOqzCVvFxFfkcRhVT9dO'),(61,'ROLE_USER','catheryn.ohara@hotmail.com',_binary '\0','Florentino','Ward',_binary '\0','$2a$10$ExSMmigQ1kZpycm8AwmnaeTLjgK7VivM8EWFMyjMGndgLxqi9Moru'),(63,'ROLE_USER','hugo.christiansen@yahoo.com',_binary '\0','Ulysses','McCullough',_binary '\0','$2a$10$3WccV3TQCKX9xxZDZeDC9.OUXjxekLXIkDRTCVvDhBfPWwmYfHPzy'),(64,'ROLE_USER','penny.wiza@yahoo.com',_binary '\0','Edwardo','Tillman',_binary '\0','$2a$10$TYc1dHcDtVZEaKqHY8shI.rI4.cMDaTAjjlOQFV3T9f0GmrrD1ggu'),(67,'ROLE_USER','arnold.feil@yahoo.com',_binary '\0','Ethan','Deckow',_binary '\0','$2a$10$j18eU1brK2DaRIgYoKVc5uQiqo3Y6OkRTMW5A/MVV2Yj2AtTUx2sG'),(69,'ROLE_USER','glayds.cummings@yahoo.com',_binary '\0','Warner','Quigley',_binary '\0','$2a$10$VuOBBoicbSrDLmTbLqudf.t9pYbBNY3owLzmVlT./Vw63VQvYGRLO'),(70,'ROLE_USER','kandra.weimann@gmail.com',_binary '\0','Hayley','Zulauf',_binary '\0','$2a$10$ozXXlIOw5i5BGnfXFEI14.BnYqnE7we6wT62u0amULvKxyN/V0pQi'),(71,'ROLE_USER','dexter.halvorson@gmail.com',_binary '\0','Grady','Macejkovic',_binary '\0','$2a$10$eD8LoRE3JAYVzzUVI9c5jusAZIOrQniRTJS8OoDG1RADQPHS53CZm'),(72,'ROLE_USER','leroy.schamberger@hotmail.com',_binary '\0','Mark','Thiel',_binary '\0','$2a$10$ftRJ1YBkKHbFaYpDLxeQveTpWLBhMaRywoVUOHHEA6Kd6LS87.6ji'),(73,'ROLE_USER','dominic.miller@hotmail.com',_binary '\0','Donte','Zemlak',_binary '\0','$2a$10$BgvKhGaNo9rIlXKWpFdNg.zYtC0z4LXMaxFQsJsKNGM52lp1aWJr.'),(74,'ROLE_USER','courtney.marks@yahoo.com',_binary '\0','Virgen','Boehm',_binary '\0','$2a$10$DauSVvNYq6RcLBsT/Zk.4eSo4pdoLTKXECWAXVoh/hTjWoZcH56we'),(75,'ROLE_USER','daron.lynch@hotmail.com',_binary '\0','Kylie','Wiegand',_binary '\0','$2a$10$Ae9A3gYjDqJkwk.PfBE3FeU4ECGW4Bk5bS6Fs7TM2fljoO1.Sfzoy'),(76,'ROLE_USER','fernando.bradtke@yahoo.com',_binary '\0','Eve','Morissette',_binary '\0','$2a$10$sFyhyWcvfVINr92c2mCckuE0FVdyn7qKStvkNCfvbkL9jJZ1XWKlq'),(77,'ROLE_USER','lon.bergnaum@yahoo.com',_binary '\0','Dane','Kris',_binary '\0','$2a$10$Tg.UM5JnRdY8.EzyLJp4oun33ZjIY8yrhu6/36ty10RxpsXFSUkqC'),(78,'ROLE_USER','jeremiah.mayert@hotmail.com',_binary '\0','Hassan','Daugherty',_binary '\0','$2a$10$9NR.P8peRIRtgZdSoUvPduqJ6FCtO29zA85pn8p/9qjgAmv7f6ZNK'),(79,'ROLE_USER','enola.toy@yahoo.com',_binary '\0','Jessie','Crist',_binary '\0','$2a$10$4GP2Kfhow7NHTLI2e409Je3lXP3oCxd8oWJy.SvgJyqt7KL.50.jW'),(81,'ROLE_USER','cornelius.schumm@hotmail.com',_binary '\0','Kyle','Cremin',_binary '\0','$2a$10$/yMRto17SSmpMdLxuaSdMOglqqrbs7u9zCAwxl0CfU8WwP5ACtdFK'),(82,'ROLE_USER','zofia.ortiz@hotmail.com',_binary '\0','Deneen','Yundt',_binary '\0','$2a$10$dLEVNXfd8ujZZRGcK03Gv.Ni0oxfZfxq4uTS5jKcql3GEq75EqMma'),(83,'ROLE_USER','marcos.mayer@gmail.com',_binary '\0','Pamila','Altenwerth',_binary '\0','$2a$10$.DbGQCjzw582iKrxlaWCc.svksUbhl.d/c7RoWgkOdqxZG0a3/cN2'),(84,'ROLE_USER','carlos.lemke@gmail.com',_binary '\0','Madelaine','Wolf',_binary '\0','$2a$10$skhZYUW9tbuZP0.FBCpfsu2IwX.fiFbxAL4wJ.q.PPFHzjuzwq0gu'),(85,'ROLE_USER','randolph.veum@yahoo.com',_binary '\0','Deloise','Rice',_binary '\0','$2a$10$e8XUtirJTyLwFCVVT8CmIe/6Cw8ETX6/c88.Y32HvYuEXVpdGKdnS'),(86,'ROLE_USER','jeannine.daugherty@gmail.com',_binary '\0','Lilla','Ledner',_binary '\0','$2a$10$H.WIrF/JucPr7QmhSoD9t.gUHE3D.4UkLxbNlS82U3O2nheJqqy5q'),(87,'ROLE_USER','thomasina.schroeder@gmail.com',_binary '\0','Kevin','West',_binary '\0','$2a$10$LJ.rv3ooHNCzxCNQWPy1hOgBdmlYDfiRzJyFHJZqG.qcxN8b25Uie'),(88,'ROLE_USER','carlton.windler@gmail.com',_binary '\0','Jackqueline','Connelly',_binary '\0','$2a$10$gww3J0QXeHqdsj5dZYeSyuQmQHSUWEBIsw31Yq7kmvC93AWciL9xG'),(89,'ROLE_USER','jordan.effertz@yahoo.com',_binary '\0','Wilford','Hagenes',_binary '\0','$2a$10$yny2l8oqHZpRSGESLDHHAOuNaximH588peOHPhfAPy5VHz/SnQ9fO'),(90,'ROLE_USER','vicente.marks@gmail.com',_binary '\0','Tamiko','Shanahan',_binary '\0','$2a$10$DORNlzBb4MzYxTAtLG1UP.T/6.9AV1oNrEpDyF3l0hoD.rw9op4sa'),(91,'ROLE_USER','gerard.schmidt@hotmail.com',_binary '\0','Darius','Marquardt',_binary '\0','$2a$10$vNJzv9yzCZcdEStnfF9XjuCE8UGrSkNrnSI2BCbf3rNteONnRhAfa'),(92,'ROLE_USER','donte.bins@gmail.com',_binary '\0','Morgan','Okuneva',_binary '\0','$2a$10$loieoFqKRMuBYIHLMKQhCOzkN73kHcfSya2Jl0N4ZOGOyzMEUvmrO'),(93,'ROLE_USER','trinity.mann@gmail.com',_binary '\0','Weldon','Goldner',_binary '\0','$2a$10$f1rp5iGUs4d0NxO9kvUNfOPN47WIGKJJiYixUX4Riil4ceVIbY1Im'),(94,'ROLE_USER','annabel.gulgowski@hotmail.com',_binary '\0','Rusty','Bergnaum',_binary '\0','$2a$10$ff/duXRSYtJbzkACE2v3meNqTslRjqkH3yp4knocX9AEHqpNHS0Jm'),(95,'ROLE_USER','thanh.russel@hotmail.com',_binary '\0','Enrique','Gutkowski',_binary '\0','$2a$10$ijHhPhx2QfwxiAtXxNvLpOWmiPQhbvpxK5a.zUiD25ZbRj716pfku'),(98,'ROLE_USER','valorie.doyle@yahoo.com',_binary '\0','Elodia','Lynch',_binary '\0','$2a$10$zi9mMHV/A4K31f0udvjfwu4yLjUj0Lv2S992C3Q0xDzLh3TpBlkA2'),(99,'ROLE_USER','loyd.weimann@gmail.com',_binary '\0','Deana','Grant',_binary '\0','$2a$10$bFzOcV4u13UYMmK7uyzrcuudN6nxQN5XNPbFjfl7bYc.ZBKXz/4UW'),(100,'ROLE_USER','gregoria.mccullough@hotmail.com',_binary '\0','Elliot','Brown',_binary '\0','$2a$10$lZ89pZasDkSRqm5JScTnI.kzjqNj/edHqcLLJ/XzDPHffKUQBzyxG'),(101,'ROLE_USER','jose.bruen@yahoo.com',_binary '\0','Hubert','Gottlieb',_binary '\0','$2a$10$ujps0AFikPrU2h0WBDqipeuDdYwctfgJDx524IK/2EqGQiWY/2mrO'),(102,'ROLE_USER','stephen.schmidt@hotmail.com',_binary '\0','Rose','Sauer',_binary '\0','$2a$10$NmTMja3mVtu7j5TaUMS2meu3XVL20gVyDutcr88EGpePuarIxSPAe'),(103,'ROLE_USER','terrance.rogahn@hotmail.com',_binary '\0','Marcelene','Pouros',_binary '\0','$2a$10$FVCEFrqur4D/HB2lkY4ah.6MrBdyxkrjq1.77n83xidguNHBf5fa2'),(105,'ROLE_USER','leland.hartmann@gmail.com',_binary '\0','Leopoldo','Green',_binary '\0','$2a$10$5UI.DoSfI2cnG361VLUik.pzjV3QTaRv6eO2dfT85eLuL3BTZDF7e'),(106,'ROLE_USER','sherice.schamberger@gmail.com',_binary '\0','Mose','Tremblay',_binary '\0','$2a$10$nrmDrWA.8ypfQP/3jLQ1ZOYc1mnOaEb1nTfqm41qpmJkQZa84LBfm'),(107,'ROLE_USER','elizebeth.champlin@gmail.com',_binary '\0','Major','Kutch',_binary '\0','$2a$10$w1X4NYyxXLj6DVN9xUIW9uIir86/.eV1t/syhxbl/fayw.PUtQy46'),(108,'ROLE_USER','marybeth.torp@yahoo.com',_binary '\0','Wiley','Zieme',_binary '\0','$2a$10$YH6JfTZkzBWsMqWvX3keKej3slbuLF86l8f3HAH2msD0Bdm1uKrhW'),(109,'ROLE_USER','nakita.schimmel@gmail.com',_binary '\0','Eura','Olson',_binary '\0','$2a$10$Cwjk/wusND0gr7R8Ns8nk.kuy4VUhbVyI6BCZ9u/NerQG7Ob/.2rW'),(110,'ROLE_USER','argelia.dicki@yahoo.com',_binary '\0','Valentin','Nitzsche',_binary '\0','$2a$10$irIgnw1ioxoGosQNLSyKA.i9HA3wsOIa7s7lDgnLUkG5VpNTCyP/m'),(111,'ROLE_USER','helaine.schiller@yahoo.com',_binary '\0','Arden','Kub',_binary '\0','$2a$10$kp/K.xYcJyvJl/gV9iuSIuSGKr3s37PAuGsIvNnln/16cJZAMB.1i'),(112,'ROLE_USER','christopher.schneider@gmail.com',_binary '\0','Charles','Grady',_binary '\0','$2a$10$3DKgsk5CTeAOCrwbs5uiZukXP9aRhTpqBF32R/pU9JFYLPKirQJ8y'),(113,'ROLE_USER','jazmine.parisian@yahoo.com',_binary '\0','Carter','Fadel',_binary '\0','$2a$10$ilQj3HlZhRlhzSMB.pJNF.is4KD67FkCqqbfJfbWTtF/fNAkr/3E6'),(114,'ROLE_USER','terry.brown@gmail.com',_binary '\0','Doretta','Dickinson',_binary '\0','$2a$10$K2rv.fPdZPILYIOtZkY8XOUQxlSTZ3zIyQqUxwlTN1krucgb/befC'),(115,'ROLE_USER','morgan.treutel@gmail.com',_binary '\0','Carol','Huel',_binary '\0','$2a$10$A./tw358pL7xExTHMeA/s.cWFYvtTbz3xp4fOr2RYNyDTN1JC19tO'),(116,'ROLE_USER','roderick.goodwin@gmail.com',_binary '\0','Rudy','Treutel',_binary '\0','$2a$10$OEUbusXk8TDHguxHmUzjRu.r6sfB/2YuAXjjXxun1M6ma/n7ewGn2'),(117,'ROLE_USER','julianna.fritsch@hotmail.com',_binary '\0','Mertie','Fay',_binary '\0','$2a$10$i6RRDsfKLEWbnE2mQi76serlIVjh9fdfzur50XFDTIStqC8qXwF/i'),(118,'ROLE_USER','fernando.rau@gmail.com',_binary '\0','Kyle','Schumm',_binary '\0','$2a$10$txd7FlO2ZPGtvqK0avQxqOwwgbPszplUlzpGdqaM3PTB/IZgzEgo6'),(119,'ROLE_USER','rossie.ernser@gmail.com',_binary '\0','Jenny','Cummings',_binary '\0','$2a$10$rsntM0XSMLuiCjpMywbBWeva6ObuGv2ETnikks06lhqrNO1gzCCCe'),(120,'ROLE_USER','jody.kub@gmail.com',_binary '\0','Daron','Marks',_binary '\0','$2a$10$Jn0FEVx4RqgQMcp3BxDeDeAQZVkNY5VIurlOUs7RvY7Co2GefXmxK'),(121,'ROLE_USER','lenita.haag@hotmail.com',_binary '\0','Natosha','Gulgowski',_binary '\0','$2a$10$vS04z3gkkSMSdahiGi.k0.1hGbgH8OycHdfY7HHeN0H/xQMLQkxaS'),(122,'ROLE_USER','millicent.dietrich@yahoo.com',_binary '\0','Argentina','DuBuque',_binary '\0','$2a$10$QPrqSsfhkBLph2.UTQXSJeKZcV2jsFyopAWIE1NiqNlQXnHb.XeJW'),(123,'ROLE_USER','gaston.feeney@yahoo.com',_binary '\0','Jame','Miller',_binary '\0','$2a$10$Zi.ek2ijv0CZfWrW.Sa1MOHWhQGKbDo6G3YdF10axrDiDdWGcSgDG'),(124,'ROLE_USER','lachelle.prohaska@gmail.com',_binary '\0','Latoya','Murphy',_binary '\0','$2a$10$9fII592P1NKSEW0WpUzX6O7NP//l9/Ry3PEgqPXZsHAyDKWoD8N6u'),(125,'ROLE_USER','hosea.zemlak@gmail.com',_binary '\0','Floyd','Collier',_binary '\0','$2a$10$XrEmgJCjHB6RyP1yMameyeMVGP0bFwlOkHyYWtL.9Z5u5DTryxMRO'),(126,'ROLE_USER','agustin.kuhn@hotmail.com',_binary '\0','Steven','Romaguera',_binary '\0','$2a$10$ev7fDRkg949hdQetNtYrp.QPc7nqaU55d4/gaiKuC2ZRThMJOmXba'),(127,'ROLE_USER','chanelle.ratke@yahoo.com',_binary '\0','Epifania','Parisian',_binary '\0','$2a$10$fhsYIWg8c9xdqxdYojsDQeMwE019CHMxCgCGUgw7B0U.6HAOX/zTy'),(128,'ROLE_USER','rasheeda.white@hotmail.com',_binary '\0','Kathryne','Bergstrom',_binary '\0','$2a$10$Q3oOJhjuAiH.A9ormdcazOQqcnU5oRpp3uMRHpweS9c1.B2ciV6TC');
/*!40000 ALTER TABLE `app_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
                            `id` bigint NOT NULL AUTO_INCREMENT,
                            `active` bit(1) NOT NULL,
                            `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
                            PRIMARY KEY (`id`),
                            UNIQUE KEY `UK_46ccwnsi9409t36lurvtyljak` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,_binary '','ubrania'),(2,_binary '','gry'),(3,_binary '','zabawki'),(7,_binary '','książki'),(8,_binary '','elektronika'),(9,_binary '','inne');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `confirmation_token`
--

DROP TABLE IF EXISTS `confirmation_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `confirmation_token` (
                                      `id` bigint NOT NULL AUTO_INCREMENT,
                                      `confirmed_at` datetime(6) DEFAULT NULL,
                                      `created_at` datetime(6) NOT NULL,
                                      `expires_at` datetime(6) NOT NULL,
                                      `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                                      `app_user_id` bigint NOT NULL,
                                      PRIMARY KEY (`id`),
                                      KEY `FKo9fl25wqyh7w7mnfkdqen1rcm` (`app_user_id`),
                                      CONSTRAINT `FKo9fl25wqyh7w7mnfkdqen1rcm` FOREIGN KEY (`app_user_id`) REFERENCES `app_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `confirmation_token`
--

LOCK TABLES `confirmation_token` WRITE;
/*!40000 ALTER TABLE `confirmation_token` DISABLE KEYS */;
INSERT INTO `confirmation_token` VALUES (1,NULL,'2022-09-16 14:23:05.783522','2022-09-16 14:38:05.783621','a8c41b5f-2bc7-4058-91a4-8e5f98f3986f',1);
/*!40000 ALTER TABLE `confirmation_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donation`
--

DROP TABLE IF EXISTS `donation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `donation` (
                            `id` bigint NOT NULL AUTO_INCREMENT,
                            `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                            `created` datetime(6) DEFAULT NULL,
                            `is_delivered` bit(1) NOT NULL,
                            `phone_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                            `pick_up_comment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                            `pick_up_date` date NOT NULL,
                            `pick_up_time` time NOT NULL,
                            `quantity` int NOT NULL,
                            `street` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                            `updated` datetime(6) DEFAULT NULL,
                            `zip_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                            `institution_id` bigint NOT NULL,
                            `user_id` bigint DEFAULT NULL,
                            PRIMARY KEY (`id`),
                            KEY `FKqiaintp9rxqwmmpwj3y5dcwd1` (`institution_id`),
                            KEY `FK1r66ajegegamb0csj23kga2d` (`user_id`),
                            CONSTRAINT `FK1r66ajegegamb0csj23kga2d` FOREIGN KEY (`user_id`) REFERENCES `app_user` (`id`),
                            CONSTRAINT `FKqiaintp9rxqwmmpwj3y5dcwd1` FOREIGN KEY (`institution_id`) REFERENCES `institution` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donation`
--

LOCK TABLES `donation` WRITE;
/*!40000 ALTER TABLE `donation` DISABLE KEYS */;
INSERT INTO `donation` VALUES (33,'Hassanburgh','2022-09-20 12:31:54.395989',_binary '\0','com.github.javafaker.PhoneNumber@60f799e','Amet quasi error sit et sint facere ratione eveniet illo facilis hic molestiae voluptatibus.','2023-09-21','14:31:54',1,'52015 Nader Hills',NULL,'47727-0734',1,1),(34,'Cronamouth','2022-09-20 12:31:54.425342',_binary '\0','com.github.javafaker.PhoneNumber@60f799e','Nemo quaerat qui officia veritatis quia laborum in repudiandae voluptates ut et.','2023-09-21','14:31:54',8,'9206 Volkman Lane',NULL,'16642-9848',1,1),(35,'East Tommyshire','2022-09-20 12:31:54.428220',_binary '\0','com.github.javafaker.PhoneNumber@60f799e','Nihil vitae quo quia blanditiis porro hic accusantium sit ut laboriosam unde.','2023-09-21','14:31:54',3,'55933 Pasty Wells',NULL,'96950',1,1),(36,'Danielborough','2022-09-20 12:31:54.431111',_binary '\0','com.github.javafaker.PhoneNumber@60f799e','Eum ullam officiis distinctio reprehenderit id corrupti necessitatibus ad consequuntur rerum.','2023-09-21','14:31:54',4,'91375 Darwin Court',NULL,'31377-0514',1,1),(37,'Jastton','2022-09-20 12:31:54.434320',_binary '\0','com.github.javafaker.PhoneNumber@60f799e','Est quaerat velit autem et rerum praesentium ex eum sed inventore.','2023-09-21','14:31:54',9,'17235 Walter Village',NULL,'31231',1,1),(38,'Port Tienfurt','2022-09-20 12:31:54.437123',_binary '\0','com.github.javafaker.PhoneNumber@60f799e','Rerum numquam fugit occaecati voluptatum hic numquam eum quam ab et quaerat officia et adipisci.','2023-09-21','14:31:54',10,'98069 Klocko Harbors',NULL,'28319-1352',1,1),(39,'Parkerchester','2022-09-20 12:31:54.440035',_binary '\0','com.github.javafaker.PhoneNumber@60f799e','Natus iste voluptatem sapiente autem et voluptates repellendus magnam quis.','2023-09-21','14:31:54',4,'8539 Rice Creek',NULL,'13178-4509',1,1),(40,'South Carina','2022-09-20 12:31:54.443009',_binary '\0','com.github.javafaker.PhoneNumber@60f799e','Ipsum voluptatibus nihil hic tempora ut saepe asperiores officia voluptas enim sit aspernatur.','2023-09-21','14:31:54',2,'888 Bauch Fords',NULL,'20481',1,1),(41,'Bradfordland','2022-09-20 12:31:54.445884',_binary '\0','com.github.javafaker.PhoneNumber@60f799e','Molestias id vel quis officiis qui autem recusandae eos aut placeat placeat sed.','2023-09-21','14:31:54',10,'664 Timothy Land',NULL,'46509',1,1),(42,'Rathshire','2022-09-20 12:31:54.449710',_binary '\0','com.github.javafaker.PhoneNumber@60f799e','Qui sequi quia et quo ut adipisci numquam autem velit doloremque.','2023-09-21','14:31:54',1,'224 Corkery Manor',NULL,'19491-3810',1,1);
/*!40000 ALTER TABLE `donation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donation_categories`
--

DROP TABLE IF EXISTS `donation_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `donation_categories` (
                                       `donation_id` bigint NOT NULL,
                                       `categories_id` bigint NOT NULL,
                                       KEY `FKbuylq65emfd9ybcas2ni6iciq` (`categories_id`),
                                       KEY `FKeg2047ecjdbxcjlekg2pmhcmw` (`donation_id`),
                                       CONSTRAINT `FKbuylq65emfd9ybcas2ni6iciq` FOREIGN KEY (`categories_id`) REFERENCES `category` (`id`),
                                       CONSTRAINT `FKeg2047ecjdbxcjlekg2pmhcmw` FOREIGN KEY (`donation_id`) REFERENCES `donation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donation_categories`
--

LOCK TABLES `donation_categories` WRITE;
/*!40000 ALTER TABLE `donation_categories` DISABLE KEYS */;
INSERT INTO `donation_categories` VALUES (33,1),(33,2),(33,3),(33,7),(33,8),(33,9),(34,1),(34,2),(34,3),(34,7),(34,8),(34,9),(35,1),(35,2),(35,3),(35,7),(35,8),(35,9),(36,1),(36,2),(36,3),(36,7),(36,8),(36,9),(37,1),(37,2),(37,3),(37,7),(37,8),(37,9),(38,1),(38,2),(38,3),(38,7),(38,8),(38,9),(39,1),(39,2),(39,3),(39,7),(39,8),(39,9),(40,1),(40,2),(40,3),(40,7),(40,8),(40,9),(41,1),(41,2),(41,3),(41,7),(41,8),(41,9),(42,1),(42,2),(42,3),(42,7),(42,8),(42,9);
/*!40000 ALTER TABLE `donation_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forgotten_password_token`
--

DROP TABLE IF EXISTS `forgotten_password_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forgotten_password_token` (
                                            `id` bigint NOT NULL AUTO_INCREMENT,
                                            `confirmed_at` datetime(6) DEFAULT NULL,
                                            `created_at` datetime(6) NOT NULL,
                                            `expires_at` datetime(6) NOT NULL,
                                            `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                                            `app_user_id` bigint NOT NULL,
                                            PRIMARY KEY (`id`),
                                            KEY `FKljo9wmp2kufhstp8h90tatau` (`app_user_id`),
                                            CONSTRAINT `FKljo9wmp2kufhstp8h90tatau` FOREIGN KEY (`app_user_id`) REFERENCES `app_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forgotten_password_token`
--

LOCK TABLES `forgotten_password_token` WRITE;
/*!40000 ALTER TABLE `forgotten_password_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `forgotten_password_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `institution`
--

DROP TABLE IF EXISTS `institution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `institution` (
                               `id` bigint NOT NULL AUTO_INCREMENT,
                               `active` bit(1) NOT NULL,
                               `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                               `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
                               PRIMARY KEY (`id`),
                               UNIQUE KEY `UK_qhw15h5f7nc4g3ndva8sory1u` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institution`
--

LOCK TABLES `institution` WRITE;
/*!40000 ALTER TABLE `institution` DISABLE KEYS */;
INSERT INTO `institution` VALUES (1,_binary '','Pomoc dzieciom w potrzebie.','Św. Mikołaja'),(2,_binary '','Pomoc dzieciom z ubogich rodzin.','Dbam o Zdrowie'),(3,_binary '','Pomoc osobom znajdującym się w trudnej sytuacji życiowej.','Dla dzieci'),(4,_binary '','Pomoc wybudzeniu dzieci ze śpiączki.','A kogo'),(5,_binary '','Pomoc dla osób nie posiadających miejsca zamieszkania.','Bez Domu'),(6,_binary '','Pomoc dla osób starszych.','Mali bracia Ubogich'),(7,_binary '','Twórz z nami świat wolny od cierpienia zwierząt.','Stowarzyszenie Otwarte Klatki'),(8,_binary '','Pomoc dzieciom w szpitalu.','Czerwone Noski - Klown w Szpitalu\n'),(9,_binary '','Pomoc dla dzieci chorych na trudno uleczalne choroby.','Chcę Żyć'),(10,_binary '','Pomoc dzieciom z wrodzonymi wadami serca oraz ich rodzinom.','Cor Infantis'),(11,_binary '','Niesienie rzeczywistej, codziennej pomocy dzieciom i młodzieży niepełnosprawnej.','Dziecięce Marzenia'),(12,_binary '','budowanie systemów wsparcia dla dzieci z chorobą nowotworową i ich rodzin.','ISKIERKA');
/*!40000 ALTER TABLE `institution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message` (
                           `id` bigint NOT NULL AUTO_INCREMENT,
                           `created` datetime(6) DEFAULT NULL,
                           `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                           `first_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                           `last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                           `message_field` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                           PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (1,'2022-09-20 12:38:27.954576','rodolfo.ullrich@yahoo.com','Ashlea','Hilpert','Repellat iusto sit natus qui vitae. Iure fugiat provident placeat et. Qui quos sequi in possimus suscipit occaecati.'),(2,'2022-09-20 12:38:27.981188','lindsey.franecki@hotmail.com','Cecil','Cummings','Reprehenderit tempore officia beatae quo ad tempora. Quas quia esse molestiae nisi perferendis corrupti est. Consequatur fugiat quo libero sit voluptates.'),(3,'2022-09-20 12:38:27.984429','ouida.hoppe@gmail.com','Foster','Beatty','Officiis voluptatem repudiandae eos tempore libero qui nulla. Voluptas quo temporibus voluptatem sit cupiditate nihil cumque. Doloremque est pariatur atque eveniet quasi voluptate saepe. Odit inventore quo dolorum aut dignissimos atque et.'),(4,'2022-09-20 12:38:27.987474','crystal.huel@hotmail.com','Landon','Maggio','Quia distinctio nemo adipisci est. Est praesentium nemo facere. Repudiandae est nihil repellendus.'),(5,'2022-09-20 12:38:27.990173','aide.monahan@hotmail.com','Gladys','Bernhard','Minima sapiente et veritatis at maiores. Quaerat voluptas quo ea qui velit. Optio reiciendis architecto.'),(6,'2022-09-20 12:38:27.992825','felicitas.terry@hotmail.com','Aida','Jacobs','Voluptate qui ex voluptatibus quod quia vero vitae. Quo deserunt sint iusto dolores nam sed. Beatae officiis esse. Voluptatibus ducimus fuga nulla sit voluptate.'),(7,'2022-09-20 12:38:27.995229','lincoln.wisoky@yahoo.com','Winfred','Bednar','Vel aut repellat asperiores ipsam voluptatibus. Est cumque ut quia quam quasi fugit. Et labore sit deleniti quasi cumque non. Aliquid et voluptatem.'),(8,'2022-09-20 12:38:27.998119','haywood.boehm@hotmail.com','Deb','Halvorson','Magni sed provident nisi nesciunt eveniet ex est. Facilis impedit nulla quis et eum qui quos. Assumenda nobis vel quaerat. Molestiae est architecto asperiores.'),(9,'2022-09-20 12:38:28.001217','marc.larkin@yahoo.com','Anthony','Howell','Officia dicta atque dicta atque delectus. Quidem qui sunt dolorem ad id. Exercitationem ad aperiam.'),(10,'2022-09-20 12:38:28.004050','marshall.conroy@hotmail.com','Joey','Leannon','Quod laborum voluptas animi placeat amet autem ea. Aut sequi assumenda.'),(11,'2022-09-20 12:38:28.006697','mitchel.schinner@gmail.com','Khalilah','King','Doloremque sit distinctio nulla. Alias adipisci aspernatur. Facere repudiandae libero architecto et sed commodi dolor.'),(12,'2022-09-20 12:38:28.009236','desmond.kunze@hotmail.com','Tia','Ritchie','Sed et magni nihil. Ipsam voluptatibus ducimus aut ad provident quia et. Illum dicta ipsam quia et ea culpa provident. Velit aliquid et necessitatibus commodi et.'),(13,'2022-09-20 12:38:28.011478','delois.borer@hotmail.com','Jutta','Hermiston','Illum quia voluptatem. Dolor et in sunt.'),(14,'2022-09-20 12:38:28.014379','keith.ullrich@hotmail.com','Beckie','Hartmann','Omnis ut voluptas. Sed et corrupti numquam iure commodi laboriosam maiores. Consequatur omnis et nihil harum nobis et.'),(15,'2022-09-20 12:38:28.017736','jan.block@gmail.com','Shelton','Zboncak','Nam accusantium voluptatem cum. Consequatur veniam excepturi laboriosam ipsam sed saepe cum.'),(16,'2022-09-20 12:38:28.021250','stanley.hauck@gmail.com','Era','Kulas','Recusandae nihil necessitatibus aperiam cupiditate similique dolores ab. Quia perferendis natus reprehenderit rem. Molestiae voluptas repellendus perspiciatis. Ducimus illum error voluptatem sint.'),(17,'2022-09-20 12:38:28.024203','miss.ohara@hotmail.com','Randal','Greenholt','In cupiditate voluptas incidunt natus atque. Suscipit aut placeat et ut qui qui sed. Non libero minima illo sunt molestias dolorem.'),(18,'2022-09-20 12:38:28.026654','rocco.kertzmann@gmail.com','Gabriel','Borer','Repellendus ut facilis assumenda tenetur facilis a. Optio nemo sequi. Nisi ut laborum minima. Tenetur eius illum repudiandae.'),(19,'2022-09-20 12:38:28.029025','leslie.streich@hotmail.com','Linwood','Jakubowski','Illum eum vitae. Ut quaerat ut.'),(20,'2022-09-20 12:38:28.031726','chrystal.gleason@yahoo.com','Alva','Ratke','Praesentium deserunt sint velit culpa asperiores. Corporis enim rerum dolore facilis asperiores necessitatibus. Eligendi tenetur dolor provident repellendus ea. Minus rerum est.'),(21,'2022-09-20 12:38:28.034291','napoleon.rath@yahoo.com','Carline','Schneider','Excepturi occaecati dolor unde dolores ducimus. Animi iure tempora esse voluptates optio quod. Voluptas minima et et vero et. Asperiores voluptatem quae.'),(22,'2022-09-20 12:38:28.036784','steffanie.brown@hotmail.com','Trenton','Heathcote','Voluptatum rerum reiciendis quia fuga. Enim eos laudantium nam magni aliquid distinctio.'),(23,'2022-09-20 12:38:28.039437','brande.thompson@gmail.com','Jann','Hoeger','Et explicabo natus sit aliquam. Quisquam quaerat possimus et. Inventore quo in sed rerum qui laborum.'),(24,'2022-09-20 12:38:28.041584','tyree.fay@hotmail.com','Santos','Emard','Voluptatum dolor sit deserunt nihil. Molestiae similique eaque nesciunt.'),(25,'2022-09-20 12:38:28.043504','lyman.parisian@yahoo.com','Lanny','Parker','Nobis rerum quia vitae reprehenderit maiores aut. In sit vitae non rerum nostrum architecto. Explicabo consectetur harum saepe tenetur libero distinctio. Pariatur enim quis.'),(26,'2022-09-20 12:38:28.045494','dewayne.okeefe@hotmail.com','Boris','Hegmann','Aut vel dicta. Tempora delectus impedit earum nam. Fugit ex eius assumenda similique eaque. Quae ut ea quis rerum unde recusandae.'),(27,'2022-09-20 12:38:28.047636','ivana.willms@yahoo.com','Lida','Cronin','Impedit sapiente quia a dolorem non. Sed repudiandae nihil omnis. Vel inventore culpa autem omnis minus.'),(28,'2022-09-20 12:38:28.049908','sanford.bahringer@hotmail.com','Gertrude','Kassulke','Repellat et voluptatibus veniam impedit illo. Voluptas doloremque facilis omnis molestias provident voluptatum. Aliquid pariatur accusamus aut. Laboriosam sed error eos cupiditate earum.'),(29,'2022-09-20 12:38:28.051911','von.vandervort@yahoo.com','Wilfredo','DuBuque','Placeat et quas accusantium accusantium. Et ipsam architecto.'),(30,'2022-09-20 12:38:28.053711','kina.koepp@hotmail.com','Kendall','Renner','Excepturi alias qui doloremque enim. Nihil accusantium illum ratione quod. Nostrum dolorem officia.'),(31,'2022-09-20 12:38:28.055460','genesis.raynor@yahoo.com','Judson','Thiel','Quae repudiandae dolorum. Omnis quaerat deserunt est doloribus.'),(32,'2022-09-20 12:38:28.057392','erasmo.rice@yahoo.com','Miguelina','Conn','Nam nemo consequuntur. Laborum hic blanditiis architecto ipsum. Sed quia perferendis.'),(33,'2022-09-20 12:38:28.059777','lawrence.rutherford@gmail.com','Anne','Littel','Eos ex quis voluptatem. Sint tempora ut.'),(34,'2022-09-20 12:38:28.062266','jeff.larson@yahoo.com','Johanne','Steuber','Exercitationem et vel sint. Voluptatibus distinctio in illum cupiditate vel omnis.'),(35,'2022-09-20 12:38:28.064228','fallon.halvorson@hotmail.com','Lanny','Fritsch','Adipisci molestias praesentium. Deleniti rerum incidunt tempore laboriosam dolores.'),(36,'2022-09-20 12:38:28.066285','merideth.lemke@yahoo.com','Eduardo','Boyer','Aliquid et ea. Est est assumenda.'),(37,'2022-09-20 12:38:28.068221','melany.purdy@gmail.com','Paul','Hilpert','Perferendis distinctio assumenda nam illum cupiditate aperiam. Enim qui praesentium neque exercitationem.'),(38,'2022-09-20 12:38:28.070444','cammie.morissette@gmail.com','Salina','Brown','Sed mollitia iusto explicabo dignissimos quis sit. Reprehenderit ad excepturi veritatis repellendus. Quas nam quod.'),(39,'2022-09-20 12:38:28.072233','adelle.stark@hotmail.com','Kym','Thompson','Fuga soluta ea non. Natus commodi magni odio.'),(40,'2022-09-20 12:38:28.073860','jack.conn@yahoo.com','Carmel','Mann','Debitis quia velit impedit et. Iusto aliquid aut.'),(41,'2022-09-20 12:38:28.075609','irwin.konopelski@yahoo.com','Zaida','Kertzmann','Doloribus vitae placeat inventore laboriosam laudantium possimus aut. Neque harum in enim sunt vel dolor sit. Eaque ut quibusdam.'),(42,'2022-09-20 12:38:28.077351','doris.deckow@hotmail.com','Adrian','Wehner','Eos dolor omnis. Aut sint corrupti maiores ab.'),(43,'2022-09-20 12:38:28.079000','raphael.hermann@yahoo.com','Shin','Wehner','Odio qui id harum. Commodi culpa itaque cupiditate ea.'),(44,'2022-09-20 12:38:28.081288','armida.hansen@gmail.com','Raleigh','Zulauf','Adipisci iure et ea veniam corporis corporis. Impedit distinctio saepe voluptatem suscipit est.'),(45,'2022-09-20 12:38:28.083178','breann.berge@gmail.com','Terrance','Hartmann','Necessitatibus hic expedita iure dolorem. Voluptatibus neque qui sit.'),(46,'2022-09-20 12:38:28.084842','felix.harvey@hotmail.com','Geneva','Marvin','Similique placeat eum delectus nihil ducimus inventore. Tempore a ut esse doloremque nesciunt nam occaecati. Assumenda sit qui voluptate. Ullam vel ipsum neque soluta.'),(47,'2022-09-20 12:38:28.087023','wally.renner@gmail.com','Forest','Feest','Voluptatem molestias voluptas et et autem dolor. Quisquam reprehenderit optio.'),(48,'2022-09-20 12:38:28.089020','marg.huels@gmail.com','Ozie','Veum','Ut ut voluptas soluta tempora voluptatem autem non. Animi veniam voluptas et.'),(49,'2022-09-20 12:38:28.091340','jolynn.wunsch@yahoo.com','Wilbert','Rutherford','Doloremque eius blanditiis consequatur assumenda nam reiciendis voluptatem. Debitis vitae libero. Expedita corporis soluta sequi totam.'),(50,'2022-09-20 12:38:28.093405','george.hoppe@hotmail.com','Jong','Lehner','Et pariatur in adipisci aut. Culpa nemo numquam id illum accusantium ab itaque. Eum maxime ad sit. Et corrupti est similique necessitatibus.'),(51,'2022-09-20 12:38:28.095323','lucius.kuphal@yahoo.com','Miranda','VonRueden','Ipsam optio et beatae ea sint et voluptatem. Aut dolorem atque non veniam necessitatibus. Quia vitae corporis quibusdam mollitia.'),(52,'2022-09-20 12:38:28.097352','ricki.rice@yahoo.com','Verna','VonRueden','Velit et tempora. Dolores quia nobis.'),(53,'2022-09-20 12:38:28.099311','robert.harris@gmail.com','Jack','Nitzsche','Natus magni qui illo beatae iure qui. Distinctio vel est debitis aut nobis dolorum labore. Recusandae qui et.'),(54,'2022-09-20 12:38:28.101204','sunni.zieme@yahoo.com','Forest','Douglas','Quaerat quis consequuntur soluta. Quasi quo iure commodi.'),(55,'2022-09-20 12:38:28.102648','denisha.grimes@gmail.com','Tama','Macejkovic','Et dolore totam voluptas quaerat. Delectus architecto enim quia autem ut. Dignissimos voluptatem iste in aut. Illum sapiente tenetur magni explicabo laborum fugiat optio.'),(56,'2022-09-20 12:38:28.104519','edgar.ruecker@gmail.com','Oliva','Lakin','Molestias qui ut rerum. Porro ut dolorem.'),(57,'2022-09-20 12:38:28.106991','tamiko.kerluke@yahoo.com','Altha','Kirlin','Perferendis inventore eum. Eveniet cumque culpa.'),(58,'2022-09-20 12:38:28.109263','avelina.metz@gmail.com','Tony','Botsford','Optio adipisci qui asperiores libero assumenda dicta. Repellat qui aliquid est dolorem omnis. Vel vitae debitis velit molestiae vitae nemo at.'),(59,'2022-09-20 12:38:28.111097','elma.yost@yahoo.com','Mariko','Durgan','Esse aspernatur et. Vitae error eos quia blanditiis natus nisi corrupti.'),(60,'2022-09-20 12:38:28.112760','esperanza.murazik@gmail.com','Tony','Walter','Et qui voluptatem nesciunt occaecati minus sit voluptates. Occaecati voluptatum non. Rerum cupiditate quasi distinctio illo. Recusandae id perspiciatis voluptatem est.'),(61,'2022-09-20 12:38:28.114434','fumiko.hessel@yahoo.com','Joshua','Towne','Qui deserunt sit. Provident et qui temporibus nobis voluptatum.'),(62,'2022-09-20 12:38:28.116145','audry.nicolas@gmail.com','Manuel','Reinger','Facere sunt quia rerum tenetur laboriosam. Impedit assumenda recusandae perspiciatis et rerum eveniet commodi. Dolore vitae nesciunt minus. Sit quia quod.'),(63,'2022-09-20 12:38:28.117789','jesica.effertz@hotmail.com','Rosario','Rice','Corporis laudantium necessitatibus ullam maxime aut. Ut ea voluptatibus impedit quae. Enim quia qui voluptatem quos necessitatibus ab.'),(64,'2022-09-20 12:38:28.119795','laila.donnelly@hotmail.com','Clarinda','Luettgen','Dolor in ut. Voluptatibus officiis eligendi. Reprehenderit quo est quae at.'),(65,'2022-09-20 12:38:28.122126','eloy.kiehn@hotmail.com','Christen','Schmeler','Aut est asperiores dolores consequuntur alias saepe qui. Totam sequi architecto.'),(66,'2022-09-20 12:38:28.123662','claud.nitzsche@yahoo.com','Eddie','Marks','Autem et qui. Quos occaecati optio quas. Rem alias tempora.'),(67,'2022-09-20 12:38:28.125151','ida.reilly@yahoo.com','Shantelle','Kuhn','Aut id enim quia suscipit unde voluptas. Quo ea repudiandae animi placeat totam. Dolorum veniam sit. Id sint aliquid.'),(68,'2022-09-20 12:38:28.126646','andrew.beer@yahoo.com','Dominic','Witting','Consequatur id aliquid ut et quia aut illo. Voluptatem quos provident recusandae ipsum.'),(69,'2022-09-20 12:38:28.127992','keneth.jast@hotmail.com','Malcolm','Homenick','Atque voluptatem odio debitis et sunt. Vel soluta voluptate consequatur dolores.'),(70,'2022-09-20 12:38:28.129284','lucy.wilkinson@yahoo.com','Marilee','Baumbach','Itaque nostrum eius. Quia illo voluptatibus enim aut consequatur praesentium. Corporis nihil suscipit cum et id.'),(71,'2022-09-20 12:38:28.130587','winnifred.kunze@yahoo.com','Sherron','Hamill','Eligendi dolores voluptas vel quo. Voluptatem accusamus eum adipisci quia recusandae optio labore. Dolores et voluptatem maiores commodi est nemo.'),(72,'2022-09-20 12:38:28.132132','kayleen.lang@gmail.com','Susy','Nikolaus','Rerum ut exercitationem deleniti illum accusantium necessitatibus dicta. Ducimus sunt velit dolor. Culpa aut ratione molestias enim nobis eaque a.'),(73,'2022-09-20 12:38:28.133992','anna.mraz@gmail.com','Christa','Balistreri','Reiciendis et consequatur aut iusto nostrum. Quaerat tempore minima et voluptate minima. Repellat et deleniti et.'),(74,'2022-09-20 12:38:28.135764','adan.stokes@hotmail.com','Barton','Funk','Commodi dolor enim ullam. Eaque vel totam non odit quis. Minus non id rerum consequatur recusandae quod.'),(75,'2022-09-20 12:38:28.137046','kraig.spencer@gmail.com','Jarod','Jacobson','Rerum deleniti et iusto. Non natus nihil nesciunt. Modi et quo eligendi possimus accusantium.'),(76,'2022-09-20 12:38:28.138500','delinda.bechtelar@hotmail.com','Tim','Rice','Velit ut quo ea. Enim et a voluptas. Vel numquam iusto consequatur quis id odio. Voluptatem et accusamus molestias.'),(77,'2022-09-20 12:38:28.140242','yanira.considine@hotmail.com','Lyman','Koelpin','Ullam est maxime et esse consequuntur sequi numquam. Dolor voluptates tempore aut esse ratione. Facilis in maxime consequuntur.'),(78,'2022-09-20 12:38:28.142414','elva.hartmann@yahoo.com','Riley','Langworth','Ea officiis vel accusamus ipsa at voluptatem. Animi corrupti pariatur quaerat ut ut. Magni sapiente beatae. Non soluta dolore nihil.'),(79,'2022-09-20 12:38:28.144026','randolph.mayer@yahoo.com','Nam','Bartell','Laborum quisquam qui est. Dicta accusantium quisquam accusamus non voluptatem quia dolores. Eaque repudiandae et fugiat sit itaque quisquam qui. Ut natus cupiditate ipsa.'),(80,'2022-09-20 12:38:28.145508','isaiah.johnston@hotmail.com','Darin','Macejkovic','Nesciunt et rem esse quam et. Eaque id recusandae consequuntur eveniet. Qui aliquid qui aspernatur dolor. Recusandae molestiae quis.'),(81,'2022-09-20 12:38:28.147355','phillip.smitham@gmail.com','Aurelio','Flatley','Ducimus temporibus qui. Rerum iure quia. Explicabo quod quia eos. Excepturi facilis quis.'),(82,'2022-09-20 12:38:28.148831','michaele.block@gmail.com','Erasmo','Rowe','Quo sit debitis culpa totam omnis. Laudantium quia ut repellendus in dolorem. Sed fuga soluta. Ut corporis eaque cum maiores qui ex.'),(83,'2022-09-20 12:38:28.150264','hyon.nikolaus@hotmail.com','Reanna','Friesen','Labore rerum debitis assumenda id provident maiores minus. Omnis tempora consequuntur alias.'),(84,'2022-09-20 12:38:28.153646','conrad.cole@gmail.com','Mignon','Funk','Reiciendis blanditiis qui doloribus. Repellendus neque voluptas neque aspernatur error. Qui aut non. Ut magnam eveniet.'),(85,'2022-09-20 12:38:28.155083','moses.schaefer@yahoo.com','Alfonso','Collier','Ut at possimus nam commodi libero quod enim. Placeat ipsa odio placeat ullam aut earum.'),(86,'2022-09-20 12:38:28.156417','alica.west@hotmail.com','Bryan','Dicki','Aperiam veniam voluptate reiciendis nulla. Autem atque dolor ut maxime ut.'),(87,'2022-09-20 12:38:28.157804','ken.roob@gmail.com','Kali','Wiegand','Debitis ipsam fugit rerum unde modi et et. Libero fuga porro quos laboriosam officiis at fugit.'),(88,'2022-09-20 12:38:28.158964','yael.bernier@yahoo.com','Arianna','Macejkovic','Iusto mollitia tempora sint iste saepe quas. Incidunt unde adipisci eos atque. Quis ullam omnis dolores atque cupiditate est et.'),(89,'2022-09-20 12:38:28.160370','christel.bernier@hotmail.com','Renata','Runte','Id cumque reprehenderit aut quia. Sed beatae architecto.'),(90,'2022-09-20 12:38:28.161763','bennie.pagac@gmail.com','Antwan','Champlin','Sed beatae magni earum. Omnis beatae iste dolore ullam maiores.'),(91,'2022-09-20 12:38:28.162958','wallace.cassin@yahoo.com','Sheilah','Langosh','Autem placeat natus deleniti omnis magni molestiae. Blanditiis necessitatibus deleniti maiores repudiandae rerum.'),(92,'2022-09-20 12:38:28.164332','kristen.turcotte@hotmail.com','Alia','Smith','Qui dolorem accusamus aut pariatur optio dolor non. Incidunt in labore sed. Facilis corrupti ullam reiciendis. Omnis qui ut ducimus facilis vel sit.'),(93,'2022-09-20 12:38:28.165719','rodney.powlowski@gmail.com','Golda','Gibson','Et harum consectetur occaecati et. Aut laudantium unde molestias minima repellat nemo suscipit.'),(94,'2022-09-20 12:38:28.167214','cristobal.haag@hotmail.com','Daphne','Bechtelar','In tenetur consequatur atque odio aliquam est. Vel praesentium voluptatem laudantium voluptas rem.'),(95,'2022-09-20 12:38:28.169078','christa.senger@hotmail.com','Cassy','Glover','Amet qui magnam commodi modi. Enim ea odio non natus minus sit saepe. Illo eligendi tempora laborum sed autem id.'),(96,'2022-09-20 12:38:28.170487','francine.daniel@hotmail.com','Major','Moore','Expedita et accusantium hic illum. Iste molestiae quisquam fugit. Sint aperiam dolorum quas et totam voluptas. Quia ab quisquam.'),(97,'2022-09-20 12:38:28.172002','peter.bayer@hotmail.com','Shemeka','Schmidt','Rerum libero ducimus esse et totam suscipit adipisci. Iusto distinctio occaecati hic ut.'),(98,'2022-09-20 12:38:28.173525','liza.renner@yahoo.com','Shauna','Stehr','Temporibus modi dicta. Deleniti occaecati et ut incidunt. Sunt esse iure sunt rerum nemo magnam. Libero esse iste.'),(99,'2022-09-20 12:38:28.175044','vincenzo.kozey@hotmail.com','Margaret','Dicki','Quibusdam corrupti sapiente consectetur aperiam nam nisi libero. Et quis laudantium laboriosam facere quia quia voluptas. Soluta iste aut quo.'),(100,'2022-09-20 12:38:28.176348','venice.weimann@hotmail.com','Beverley','Runte','Sit ratione qui dolore quia dolorum earum. Cum natus et eos.');
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-20 14:46:49