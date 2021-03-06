USE [master]
GO
/****** Object:  Database [DBLOL]    Script Date: 3/30/2020 4:22:48 PM ******/
CREATE DATABASE [DBLOL]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DBLOL', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.FTEES\MSSQL\DATA\DBLOL.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DBLOL_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.FTEES\MSSQL\DATA\DBLOL_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [DBLOL] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBLOL].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBLOL] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DBLOL] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DBLOL] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DBLOL] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DBLOL] SET ARITHABORT OFF 
GO
ALTER DATABASE [DBLOL] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DBLOL] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DBLOL] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DBLOL] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DBLOL] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DBLOL] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DBLOL] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DBLOL] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DBLOL] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DBLOL] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DBLOL] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DBLOL] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DBLOL] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DBLOL] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DBLOL] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DBLOL] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DBLOL] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DBLOL] SET RECOVERY FULL 
GO
ALTER DATABASE [DBLOL] SET  MULTI_USER 
GO
ALTER DATABASE [DBLOL] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DBLOL] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DBLOL] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DBLOL] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DBLOL] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'DBLOL', N'ON'
GO
ALTER DATABASE [DBLOL] SET QUERY_STORE = OFF
GO
USE [DBLOL]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 3/30/2020 4:22:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[id] [nvarchar](200) NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[role] [nchar](20) NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Area]    Script Date: 3/30/2020 4:22:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Area](
	[id] [nchar](10) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[imgLink] [nvarchar](max) NULL,
	[longDesc] [nvarchar](max) NULL,
 CONSTRAINT [PK_Area] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[comment]    Script Date: 3/30/2020 4:22:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[comment](
	[commentID] [int] IDENTITY(1,1) NOT NULL,
	[postID] [int] NOT NULL,
	[content] [nvarchar](250) NOT NULL,
	[account ID] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_comment] PRIMARY KEY CLUSTERED 
(
	[commentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gamer]    Script Date: 3/30/2020 4:22:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gamer](
	[GamerID] [nchar](10) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[imgLink] [nvarchar](50) NOT NULL,
	[shortDesc] [nvarchar](500) NOT NULL,
	[TeamID] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Gamer] PRIMARY KEY CLUSTERED 
(
	[GamerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Post]    Script Date: 3/30/2020 4:22:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post](
	[postID] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](500) NOT NULL,
	[shortDesc] [nvarchar](500) NOT NULL,
	[longDesc] [nvarchar](max) NOT NULL,
	[imgLink] [nvarchar](500) NOT NULL,
	[date] [date] NOT NULL,
	[TopicID] [int] NOT NULL,
	[writer] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_Post] PRIMARY KEY CLUSTERED 
(
	[postID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Team]    Script Date: 3/30/2020 4:22:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Team](
	[TeamID] [nchar](10) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Score] [int] NULL,
	[AreaID] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Team] PRIMARY KEY CLUSTERED 
(
	[TeamID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Topic]    Script Date: 3/30/2020 4:22:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Topic](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TopicName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Account] ([id], [username], [password], [email], [role]) VALUES (N'Apelios', N'Ape', N'123', N'Ape@gmail.com', N'writer              ')
INSERT [dbo].[Account] ([id], [username], [password], [email], [role]) VALUES (N'BigMarvel', N'Marvel', N'123', N'bigmarvel@gmail.com', N'viewer              ')
INSERT [dbo].[Account] ([id], [username], [password], [email], [role]) VALUES (N'ftees     ', N'ftees', N'123', N'ftee@gmail.com', N'admin               ')
INSERT [dbo].[Account] ([id], [username], [password], [email], [role]) VALUES (N'Generic', N'Genmini', N'12345', N'generic@gmail.com', N'writer              ')
INSERT [dbo].[Account] ([id], [username], [password], [email], [role]) VALUES (N'Mama', N'Ma Ma Ma', N'123', N'mama@gmail.com', N'viewer              ')
INSERT [dbo].[Account] ([id], [username], [password], [email], [role]) VALUES (N'manhthang', N'manh', N'123', N'manhmam@maigm.com', N'writer              ')
INSERT [dbo].[Account] ([id], [username], [password], [email], [role]) VALUES (N'miley', N'miley', N'123', N'mileyci@gmai.com', N'writer              ')
INSERT [dbo].[Account] ([id], [username], [password], [email], [role]) VALUES (N'mnhnmam', N'Manh', N'123', N'mamaaa@gmail.com', N'writer              ')
INSERT [dbo].[Account] ([id], [username], [password], [email], [role]) VALUES (N'mokalias', N'Moka', N'123', N'makoalis@gmail.com', N'writer              ')
INSERT [dbo].[Account] ([id], [username], [password], [email], [role]) VALUES (N'Monololy', N'Monolyly', N'123', N'mono1233231@gmail.com', N'viewer              ')
INSERT [dbo].[Account] ([id], [username], [password], [email], [role]) VALUES (N'Mr Tee', N'Tee Tee', N'12345', N'', N'viewer              ')
INSERT [dbo].[Account] ([id], [username], [password], [email], [role]) VALUES (N'MrT', N'Teef', N'123', N'teef@gmail.com', N'viewer              ')
INSERT [dbo].[Account] ([id], [username], [password], [email], [role]) VALUES (N'phamtien  ', N'tien pham  nguyen', N'123', N'phamtien@gmail.com', N'writer              ')
INSERT [dbo].[Account] ([id], [username], [password], [email], [role]) VALUES (N'Ployee', N'Ploy meno', N'123321', N'mome@gmail.com', N'viewer              ')
INSERT [dbo].[Account] ([id], [username], [password], [email], [role]) VALUES (N'qqqqqrrr', N'qr', N'1233', N'oppppppp@gmail.com', N'writer              ')
INSERT [dbo].[Account] ([id], [username], [password], [email], [role]) VALUES (N'sunghajung', N'sunha sung', N'12345', N'sunhajung@gmail.com', N'writer              ')
INSERT [dbo].[Account] ([id], [username], [password], [email], [role]) VALUES (N'thor', N'hasun', N'123321', N'qqoqooq@gmail.com', N'viewer              ')
INSERT [dbo].[Account] ([id], [username], [password], [email], [role]) VALUES (N'tiendz', N'Tien Pham', N'123', N'tiennphe130789@gmail.com', N'viewer              ')
INSERT [dbo].[Area] ([id], [name], [imgLink], [longDesc]) VALUES (N'LCK       ', N'League champion Korean', N'/Images/lck.jpg', N'League of Legends Champions Korea, trước đây được biết đến với tên Ongamenet LCK và được tổ chức bởi 1Ongamenet, là đấu trường cao nhất của bộ môn thể thao điện tử Liên Minh Huyền Thoại tại Hàn Quốc. Các trận chung kết được diễn ra tại Yongshan e-Sports ở Yongsan-gu, Seoul.')
INSERT [dbo].[Area] ([id], [name], [imgLink], [longDesc]) VALUES (N'LCS       ', N'Legends Championship Series', N'/Images/lcs.jpg', N'Cấp độ cao nhất của Liên minh huyền thoại chuyên nghiệp ở Hoa Kỳ và Canada. Giải đấu esports được điều hành bởi Riot Games và có mười đội nhượng quyền. Mỗi mùa thi đấu hàng năm được chia thành hai phần, mùa xuân và mùa hè, kết thúc bằng một giải đấu loại trừ giữa sáu đội hàng đầu')
INSERT [dbo].[Area] ([id], [name], [imgLink], [longDesc]) VALUES (N'LEC       ', N'Legends European Championship', N'/Images/lec.jpg', N'Giải vô địch Liên minh huyền thoại châu Âu, trước đây được gọi là Giải vô địch Liên minh huyền thoại châu Âu, là tên của giải đấu esports Liên minh huyền thoại chuyên nghiệp do Riot Games điều hành, trong đó có năm đội thi đấu')
INSERT [dbo].[Area] ([id], [name], [imgLink], [longDesc]) VALUES (N'LMS       ', N'League Master Series', N'/Images/lms.jpg', N'Một giải đấu Liên minh huyền thoại chuyên nghiệp với các đội đến từ Đài Loan, Hồng Kông và Ma Cao. Tám đội đã thi đấu trong hai mùa để giành quyền tham dự Giải vô địch Liên minh huyền thoại thế giới.')
INSERT [dbo].[Area] ([id], [name], [imgLink], [longDesc]) VALUES (N'LPL       ', N'Legends Pro League', N'/Images/lpl.jpg', N'Cấp độ cao nhất của Liên minh huyền thoại chuyên nghiệp tại Trung Quốc. Mùa đầu tiên của LPL là mùa xuân 2013. Ba người về đích cao nhất của giải đấu playoff nhận được giá thầu tự động cho Giải vô địch Liên minh huyền thoại thế giới')
INSERT [dbo].[Area] ([id], [name], [imgLink], [longDesc]) VALUES (N'VCS       ', N'Vietnam Championship Series', N'/Images/vcs.jpg', N'Vietnam Championship Series, tên tiếng Việt thường gọi là "Giải vô địch Liên Minh Huyền Thoại Việt Nam", là giải đấu Liên Minh Huyền Thoại chuyên nghiệp duy nhất dành riêng cho các đội tuyển LMHT ở Việt Nam. Đây cũng là giải đấu mà các đội tham gia được học hỏi và có thể tìm thấy những nhà tài trợ thích hợp')
SET IDENTITY_INSERT [dbo].[comment] ON 

INSERT [dbo].[comment] ([commentID], [postID], [content], [account ID]) VALUES (1, 2, N'Hành động tuyệt vời !!!!', N'tiendz')
INSERT [dbo].[comment] ([commentID], [postID], [content], [account ID]) VALUES (2, 2, N'Hành động đầy ý nghĩa của các game thủ. hoan hô', N'thor')
INSERT [dbo].[comment] ([commentID], [postID], [content], [account ID]) VALUES (3, 8, N'Chả thấy mạnh mấy, khó chơi vcl', N'thor')
INSERT [dbo].[comment] ([commentID], [postID], [content], [account ID]) VALUES (4, 16, N'Cố lên Team Secret', N'tiendz')
INSERT [dbo].[comment] ([commentID], [postID], [content], [account ID]) VALUES (5, 16, N'Lời nguyền của rạp xiếc :))))', N'Ployee')
INSERT [dbo].[comment] ([commentID], [postID], [content], [account ID]) VALUES (6, 17, N'LCK xem vẫn cứ là mãn nhãn nhất :)))', N'thor')
INSERT [dbo].[comment] ([commentID], [postID], [content], [account ID]) VALUES (8, 17, N'Toàn trận kinh điển, giờ xem vẫn còn hồi hộp', N'Ployee')
INSERT [dbo].[comment] ([commentID], [postID], [content], [account ID]) VALUES (9, 25, N'Cố lên KT Rolters', N'tiendz')
INSERT [dbo].[comment] ([commentID], [postID], [content], [account ID]) VALUES (10, 25, N'Tuyệt vời !!!!', N'phamtien')
INSERT [dbo].[comment] ([commentID], [postID], [content], [account ID]) VALUES (11, 30, N'Cảm thấy k ổn lắm !', N'ftees')
INSERT [dbo].[comment] ([commentID], [postID], [content], [account ID]) VALUES (12, 29, N'Mạnh vcl. Đánh toàn win :)))', N'BigMarvel')
SET IDENTITY_INSERT [dbo].[comment] OFF
SET IDENTITY_INSERT [dbo].[Post] ON 

INSERT [dbo].[Post] ([postID], [title], [shortDesc], [longDesc], [imgLink], [date], [TopicID], [writer]) VALUES (1, N'Những mẹo tâm lý để có trải nghiệm tốt hơn khi chơi xếp hạng', N'Một vài điều chú ý khi chơi xếp hạng...', N'Bạn có biết việc giữ bản thân tích cực sẽ có xu hướng thành công hơn không? Không hăn là đúng 100%, nhưng nó khá là hữu ích đấy. Tư duy của bạn ở từng thời điểm sẽ ảnh hưởng đến cách bạn tiếp cận trò chơi đấy. Nếu bạn tiến vào trận đấu với tâm lý thoải mái và tích cực, bạn sẽ tự tin và lạc quan về cơ hội của mình cũng như sẵn sàng làm những bước cần thiết để chiến thắng. Nhưng nếu tâm lý bạn đang trong trạng thái không muốn nghe cũng như giao tiếp, trận đâu sẽ diễn ra thật tệ hại, số phận của điểm xếp hạng cũng không sáng sủa hơn đâu. Bạn sẽ thấy thiếu tự tin và không thể hành động đúng như những gì bạn muốn. Điều này không chỉ phá hỏng trải nghiệm của đồng đội bạn mà còn của chính bạn. Vậy nên hãy chắc chắn về tâm lý mỗi khi chơi xếp hạng nhé. Dưới đây là một số cách để bạn có thể giữ được sự thoải mãi mỗi khi chơi:<br><img class="picture1" src="Images/avatar-khazix.png" /><br>Một điều cần chú ý ở meta đó là, mỗi đường sẽ tồn tại một vị tướng được cho là mạnh nhất và ưa chuộng nhất. Vì meta thay đổi liên tục nên cần phải để ý đến những thay đổi để nhận diện những tướng này. Điều này có nghĩa những tướng xạ thủ kéo máu mạnh như Varus và Miss Fortune có thể mạnh ở một bản cập nhật, trong khi những tướng dựa vào chí mạng như Caitlyn hay Draven có thể nổi lên ở bản kế tiếp. Áp dụng vào meta hiện tại, có thể thấy những tướng đi rừng ăn thịt (Leesin, Evelynn…), hỗ trợ buff (Soraka, Lulu..), hay những tướng đường giữa mang thiên hướng hỗ trợ như (Zilena, Karma…) được coi là những tướng Off-meta.Một điều quan trọng nữa khi luyện tập những tướng Off-meta ở chế độ đánh thường bạn sẽ biết rằng vị tướng mình chọn mạnh ở kèo đấu nào. Chơi càng nhiều, bạn sẽ gặp nhiều tướng khác nhau. Điều này cho bạn cơ hội để đối mặt, tìm ra cách đánh bại nhiều đội hình khác nhau. Đương nhiên những vị tướng Off-Meta không phải lúc nào cũng kết hợp tốt với đồng đội, đừng sợ thua những trận luyện tập, những thông tin bạn có được sau trận thua sẽ rất quan trọng đấy.', N'\Images\avatar-jayce-600-338.jpg', CAST(N'2020-03-30' AS Date), 2, N'phamtien')
INSERT [dbo].[Post] ([postID], [title], [shortDesc], [longDesc], [imgLink], [date], [TopicID], [writer]) VALUES (2, N'Game thủ LMHT chuyên nghiệp Hàn Quốc chung tay hỗ trợ đẩy lùi đại dịch COVID- 19', N'Chung tay đẩy lùi dịch bệnh.', N'Đại dịch COVID- 19 bùng phát ở một số quốc gia không chỉ ảnh hưởng sức khỏe con người mà còn tác động xấu đến hàng loạt lĩnh vực cuộc sống, trong đó có Esports. Rất nhiều giải đấu Liên Minh Huyền Thoại trên thế giới bị tạm hoãn vô thời hạn như LCK , phải thi đấu online như LPL hay nhẹ nhất là VCS với việc GG Stadium cấm khán giả đến cổ vũ. Trong thời điểm vô cùng khó khăn ấy, rất nhiều game thủ chuyên nghiệp Hàn Quốc đã cùng nhau ủng hộ vật chất nhằm ngăn cản sự lây lan và bùng phát của đại dịch. <br> <img class="picture1" src="Images/chovy.jpeg" /> <br>“Tôi biết rằng đang có rất nhiều người gặp khó khăn bởi sự lây lan của Corona virus nên tôi nghĩ mình phải làm điều gì đó để giúp đỡ họ.”, Chovy cho biết. “Là một tuyển thủ chuyên nghiệp, tôi cảm thấy mình mang ơn của những người đã cổ vũ cho mình và tôi hi vọng những đóng góp của tôi sẽ báo đáp được phần nào sự theo dõi và ủng hộ của khán giả. Tôi sẽ nỗ lực hết mình để trở thành một tấm gương tốt cho mọi người.”', N'\Images\faker.jpg', CAST(N'2020-03-27' AS Date), 1, N'phamtien')
INSERT [dbo].[Post] ([postID], [title], [shortDesc], [longDesc], [imgLink], [date], [TopicID], [writer]) VALUES (8, N'Hướng dẫn lối chơi Senna “không ăn lính vẫn khỏe” đường dưới', N'Senna siêu mạnh luôn', N'Sau những thay đổi về nội tại của Senna ở phiên bản 10.3, vị tướng này đã không còn là một lựa chọn được ưa tiên ở vị trí xạ thủ đường dưới mà thay vào đó là hỗ trợ. Tuy nhiên, Senna có một tiềm năng rất lớn khiến cho nhiều tuyển thủ chuyên nghiệp tiếp tục sử dụng vị tướng này và cuối cùng đã tìm ra được một lối chơi phù hợp để thích nghi với những thay đổi mà Riot đưa ra.<br><img class="picture1" src="Images/ors-barczy-senna-008-600x338.jpg" /><br>Nhánh cảm hứng với Nâng Cấp Băng Giá kết hợp Vận Tốc Tiếp Cận là 2 điểm kết hợp rất tốt với nội tại của Senna và giúp vị tướng này gây làm chậm cũng như có tốc độ di chuyển lớn. Bước Chân Màu Nhiệm là lựa chọn tốt nhất ỏ nhánh thứ hai khi mà bộ trang bị của Senna mà người viết hướng tới ở dưới không cần trang bị này. Điểm Bánh Quy đem tới khả năng hồi phục lớn và tăng năng lượng cộng thêm rất hữu dụng cho vị tướng bắt buộc phải trao đổi chiêu thức như Senna.

Hiện Diện Trí Tuệ sau khi được chỉnh sửa đem lại một lượng năng lượng cực lớn (gấp đôi Dải Băng Năng Lượng) nên rất tốt cho Senna. Nhát Chém Ân Huệ, Chốt Hạ hay Chốt Chặn Cuối Cùng đều tốt cả và sử dụng tùy theo phong cách mỗi người.', N'\Images\senna.jpg', CAST(N'2020-03-27' AS Date), 2, N'phamtien')
INSERT [dbo].[Post] ([postID], [title], [shortDesc], [longDesc], [imgLink], [date], [TopicID], [writer]) VALUES (14, N'[VCS Mùa Xuân 2020] Vấp ngã trước VGA và FTV, liệu Cerberus eSports có hụt hơi trong cuộc đua top4?', N'Trong bài viết này, hãy phân tích nguyên nhân những thất bại của Cerberus và cơ hội playoff của họ khi những vòng đấu cuối đã cận kề.', N'Sau 3 trận đấu của lượt về VCS Mùa Xuân 2020, Cerberus thắng 1 và thua 3. Điều đáng nói ở đây là họ đã đánh bại một đội tuyển được đánh giá rất cao là Team Secret nhưng lại chịu thua trước V Gaming Adonis và FTV, 2 đội đang ở ngụp sâu ở phía cuối bảng xếp hạng. Không thể phủ nhận những cố gắng và nỗ lực của FTV và VGA nhưng rõ ràng nếu xét về mặt chuyên môn người chơi, họ không thể so sánh được với Cerberus, một đội tuyển sở hữu tiềm lực kinh tế hùng hậu. Điều gì khiến “khuyển vương 3 đầu” nhận thất bại cay đắng trước 2 đội tuyển yếu hơn? Liệu họ có hụt hơi trên cuộc đua top 4? Trong bài viết này, hãy phân tích nguyên nhân những thất bại của Cerberus và cơ hội playoff của họ khi những vòng đấu cuối đã cận kề.', N'\Images\89656309_815097948998358_9198623198344642560_o.jpg', CAST(N'2020-03-27' AS Date), 1, N'apelios')
INSERT [dbo].[Post] ([postID], [title], [shortDesc], [longDesc], [imgLink], [date], [TopicID], [writer]) VALUES (16, N'Chuỗi trận lượt về quay lại ám ảnh Team Secret', N'Secret đang có phong độ không tốt...', N'Kể từ sau trận thua trước GAM Esports, Team Secret thắng một mạch 3 trận liên tiếp một cách thuyết phục, trong đó có cả đội tuyển đứng đầu bảng xếp hạng lúc đó, Team Flash. Chiến thắng trước FL cũng đánh dấu một lượt đi thành công với đội hình kỳ cựu của họ. Khởi đầu lượt về với chiến thắng dễ dàng trước FTV khiến người hâm mộ tin rằng TS đã tìm được sự ổn định của mình, nhưng ngay sau đó Team Secret liền để thua 2 trận đấu trước DBL và CES, điều đáng nói ở đây là trước những trận đấu này Team Secret luôn được đánh giá cao hơn. Sau 2 trận thua trước những đối thủ đang cạnh tranh cho top 4, vị trí của TS cũng không còn chắc chắn như trước nữa. Chỉ cần thêm một lần sảy chân, họ sẽ ngay lập tức bị nhóm sau áp sát. Việc để Celeb liên tục chơi Syndra liên tục xem ra chưa có hiệu quả khi tỷ lệ thắng hiện tại của Celeb với Syndra chỉ là 25% (1 ván thắng sau 4 ván được chọn). Cách cấm chọn của đội nên hướng tới Celeb nhiều hơn vì ngoài Aphelios, Senna ra Xayah hay Ezreal cũng là những tướng mà xạ thủ này chơi tốt. Với việc chạm trán GAM ở tuần thi đấu tới, Team Secret sẽ cần nỗ lực rất nhiều trong 2 tuần cuối của vòng bảng.<br><img class="picture1" src="Images/ts.jpg" /><br>Trước Leblanc của Naul, Cassiopeia trong tay Artifact gặp khó với Naul kể từ giai đoạn đi đường và dần trở nên vô hại. Lượng sát thương đóng góp cho Team Secret chỉ chiếm 17.4%, trong khi đó Leblanc của Naul đóng góp tới 36% tổng sát thương cả đội. Có những lúc một mình Naul dồn ép 4 người của TS, còn Artifact dù có khoảng trống cũng không thể gây đủ sát thương. Hay trong trận đấu với CES vừa rồi, Artifact cũng không thể hiện được nhiều. Được lựa chọn Kalista đang hot, nhưng có vẻ Artifact chưa quen tay với lựa chọn này, về cuối trận anh có những tình huống chủ quan lỗi vị trí dẫn đến bị bắt lẻ.

Còn trong ván đấu quyết định, với một kèo đấu được đánh giá nhỉnh hơn, Irelia của Artifact có một ván đấu thảm họa trước Yado khi tất cả những gì anh làm được chỉ là đóng góp 7.8% sát thương cả đội, ngang bằng với Nautilus hỗ trợ của Venus. Với chiến thuật đánh xoay quanh đường giữa của TS hiện tại, màn trình diễn của Artifact gần đây là chưa đạt yêu cầu, TS cần Artifact trở lại để tiếp tục hướng tới chiến thắng.', N'\Images\hani.jpg', CAST(N'2020-03-27' AS Date), 1, N'apelios')
INSERT [dbo].[Post] ([postID], [title], [shortDesc], [longDesc], [imgLink], [date], [TopicID], [writer]) VALUES (17, N'Điểm qua những trận đấu LCK đáng nhớ nhất trong lịch sử cùng những tuyển thủ LCK nổi tiếng', N'Cùng điểm qua những trận đấu LCK đáng nhớ nhất trong lịch sử', N'Ngày mùng 6 tháng 3 vừa qua, Riot Games đã đưa ra thông báo rằng giải đấu LCK sẽ phải tạm hoãn nhằm đảm bảo an toàn cho các tuyển thủ trước mối đe dọa từ dịch bệnh do chủng virus COVID – 19. Vì không có trận đấu nào được tổ chức nên mới đây, chúng tôi đã có cuộc phỏng vấn với một số tuyển thủ và nhờ họ chọn ra những trận đấu LCK đáng nhớ nhất để các bạn có thể thưởng lãm trong thời gian đợi chờ này.<br><img class="picture1" src="Images/bott1.jpeg" /><br>Trước đây, không ai từng nghĩ rằng họ có thể cùng thi đấu với nhau dưới một màu áo. Park “Teddy” Jin-seong, xạ thủ đã chứng tỏ được thực lực của mình với những màn thể hiện xuất chúng và tân binh của T1, Lee “Effort” Sang-ho. Trước khi trở thành cặp đôi đường dưới của T1, họ đã từng đối đầu với nhau trong game đấu kéo dài tới 94 phút vào năm 2018. Teddy chia sẻ: “ Nhớ lại về trận đấu đó, thật là tuyệt vời khi chúng tôi có thể thi đấu lâu đến vậy và càng đáng nhớ hơn khi chúng tôi là những người giành chiến thắng chung cuộc.” Đúng như những gì Teddy nói, đó là trận đấu dài nhất trong lịch sử. Trong khi SKT nỗ lực để chấm dứt trận đấu nhưng bất thành, Teddy thực sự là một con quái vật với vị tướng Sivir trong tay. Lúc đó, cả hai đều là những thành viên trẻ tuổi nhất ở mỗi đội và giờ đây họ đã trưởng thành và cùng nhau tạo nên một cặp đôi đáng tin cậy ở đường dưới.', N'\Images\o1584086773752829.jpeg', CAST(N'2020-03-27' AS Date), 1, N'miley')
INSERT [dbo].[Post] ([postID], [title], [shortDesc], [longDesc], [imgLink], [date], [TopicID], [writer]) VALUES (18, N'[Phá đảo Đấu Trường Chân Lý] Xây dựng đội hình không thể cứng hơn với 4 Tiên Phong', N'Giáp to sát thương cũng to luôn', N'Nguyên tắc cốt lõi
Có 4 Tiên Phong càng sớm càng tốt (Jayce, Mordekaiser, Wukong và Leona/Poppy). Với lượng giáp cộng thêm lớn (thêm 250 giáp), bạn có thể đánh bại kha khá đội hình đối thủ ở giai đoạn giữa trận hoặc mất ít máu nếu thua.
Tập trung kiếm Jayce, Mordekaiser 3*. Đây mới là khởi đầu mùa 3, tướng còn khá ít nên sẽ không quá khó khăn.
Từ cấp 3 đến cấp 7 nên kẹp thêm Không Tặc để có lượng tiền lớn xoay tướng hoặc up cấp.
Cho Mordekaiser trang bị sát thương theo thời gian, cho Jayce trang bị sát thương và chống chịu.
Nên xoay kiếm tướng 3* ở cấp 6.
Điểm mạnh
Sử dụng tốt hầu hết mọi trang bị.
Cực mạnh ở giai đoạn giữa trận với các chủ lực Jayce, Mordekaiser (dễ nâng 2* sớm).
Điểm yếu
Khi bị tranh bài thì khó có được Jayce, Mordekaiser 3* dẫn đến top 7 top 8 trong tầm tay.
Sát thương chủ lực toàn tay ngắn nên không thể đánh vào hàng sau được.', N'\Images\avatar-reksai-1280x720.jpg', CAST(N'2020-03-27' AS Date), 2, N'miley')
INSERT [dbo].[Post] ([postID], [title], [shortDesc], [longDesc], [imgLink], [date], [TopicID], [writer]) VALUES (19, N'Hủy diệt đấu trường Summoner’s Rift cùng đại ca Sett đường trên', N'Vậy là vị tướng mới nhất của Liên Minh Huyền Thoại đã ra mắt được một tuần. Thời gian này cũng có thể coi là đủ để chúng ta có cái nhìn về những ưu, nhược điểm và lối lên trang bị hợp lý cũng như vị trí phù hợp cho Sett.', N'Không Trượt Phát Nào (Q) sẽ được ưu tiên nâng tối đa đầu tiên vì khả năng gây sát thương thêm dựa trên máu đối thủ, tích nhanh cộng dồn cho ngọc Chinh Phục cũng như cho Sett thêm tốc độ di chuyển khi hướng về phía đối thủ. Tiếp sau đó, Song Thú Chưởng (E) sẽ là kỹ năng tiếp theo được nâng tiếp vì đây là kỹ năng khống chế gần như là duy nhất của Sett, giúp Đại Ca có thể giữ đối thủ lại và thoải mái đánh đập. Cuồng Thú Quyền (W) được nâng tối đa sau cùng vì đây là kỹ năng dạng tích cần thời gian để tung chưởng. Bên cạnh đó, để sử dụng hiệu quả kỹ năng này Sett cần phải lao vào chống chịu và đánh đập đối thủ một hồi để tích được điểm Gan Góc, đầu trận khi chống chịu chưa nhiều thì Sett khó có dùng kỹ năng này ở mức tối đa sát thương vậy nên không nên ưu tiên kỹ năng này. Chiêu cuối Hủy Diệt Đấu Trường (R) lấy đúng cấp độ.', N'\Images\sett-mecha-kingdoms-uhdpaper.com-4K-5.1433-wp.thumbnail-1.jpg', CAST(N'2020-03-27' AS Date), 3, N'Generic')
INSERT [dbo].[Post] ([postID], [title], [shortDesc], [longDesc], [imgLink], [date], [TopicID], [writer]) VALUES (20, N'Những bí quyết giúp bạn leo xếp hạng ở vị trí Xạ Thủ', N'Học cách farm cho chuẩn trước khi muốn bắn cả thế giới nhé!', N'Chơi Cùng Một Hỗ Trợ Chuẩn Mực
Trò chơi cho phép bạn duo cùng một người chơi khác trong khi leo xếp hạng đơn, và tận dụng điều này là một trong những chìa khóa tốt nhất để leo xếp hạng. Ở các bậc xếp hạng thấp, điểm yếu chí mạng nhất các đội hình thường là không có một hỗ trợ đích thực do “aI CũNg MuỐn GAnK TeM”, tạo ra những lổ hổng rất lớn về mặt đội hình như thiếu khả năng mở giao tranh, thiếu chống chịu, hay thiếu khống chế. Ở riêng vị trí Xạ Thủ, bạn chắc chắn sẽ gặp rất nhiều khó khăn và ức chế nếu gặp phải một hỗ trợ không phù hợp, hoặc thậm chí là sở hữu một thái độ tồi và không xem bạn ra gì. Sau đây là một số lý do có thể khiến giai đoạn đi đường và giao tranh của một Xạ Thủ tan nát vì không có hỗ trợ phù hợp:

Khác biệt về lối chơi: Bạn tập trung farm lính, nó lao lên đánh nhau và chết
Lựa chọn tướng không phù hợp: Varus, Kog’Maw, Ashe của bạn sẽ sống sao trước các Đấng nếu đồng đội chọn ngay một con Brand để hỗ trợ…
Khác biệt về mục tiêu khi leo rank.
Thiếu hiểu ý nhau.', N'\Images\HeadCrabeD.jpg', CAST(N'2020-03-27' AS Date), 3, N'Generic')
INSERT [dbo].[Post] ([postID], [title], [shortDesc], [longDesc], [imgLink], [date], [TopicID], [writer]) VALUES (21, N'Tung đấm hứng skin – Sở hữu sớm trang phục qua sự kiện Đấm Phát Chết Luôn từ 20/03 đến 26/03', N'Đấm phát chết luôn, nhận kinh nghiệm và đổi phần thưởng nào!', N'Tung đấm hứng skin – Sở hữu sớm trang phục qua sự kiện Đấm Phát Chết Luôn từ 20/03 đến 26/03
Đấm phát chết luôn, nhận kinh nghiệm và đổi phần thưởng nào!
 Tin Game |  March 20, 2020 |  By HQ
Share
19032020-DamPhatChetLuon-800x450
THỜI GIAN
Sự kiện sẽ diễn ra từ 10:00 20/03/2020 đến 23:59 25/03/2020

NỘI DUNG SỰ KIỆN
giao-dien-su-kien-dam-phat-chet-luon

Sát thương của bạn bằng số RP hiện có.
Nếu sát thương cao hơn mức yêu cầu, bạn có thể 「ĐẤM PHÁT CHẾT LUÔN!」 để nhận phần thưởng + EXP.
Tích đủ 1200 EXP để đổi một phần thưởng tùy chọn!
Phần thưởng ngẫu nhiên sẽ ưu tiên các trang phục của tướng bạn đang sở hữu.
Nếu nhận được trang phục của tướng bạn chưa sở hữu, bạn sẽ được tặng luôn tướng đó.
Nếu đã sở hữu toàn bộ trang phục cùng loại, bạn sẽ nhận được phần thưởng thay thế:
Trang phục 120-180 RP = 3 Bộ Tuyệt Phẩm
Trang phục 210-290 RP = 5 Bộ Tuyệt Phẩm
Trang phục 310 RP = 6 Bộ Tuyệt Phẩm
Các trang phục Twitch Chuột Thiện Xạ, Taric Tấm Khiên Chói Lóa, Talon Sát Thủ Rừng Sâu sẽ được mở bán bình thường sau khi sự kiện kết thúc.', N'\Images\LOL_HuyetNguyet_Katarina_Hop_800x450.jpg', CAST(N'2020-03-27' AS Date), 2, N'sunghajung')
INSERT [dbo].[Post] ([postID], [title], [shortDesc], [longDesc], [imgLink], [date], [TopicID], [writer]) VALUES (22, N'Sale Chớp Nhoáng phiên bản đặc biệt – Trứng Nhóm 7', N'Sale Chớp Nhoáng đã xuất hiện với phiên bản đặc biệt với vật phẩm Trứng Nhóm 7.', N'Chương trình có một số lưu ý như sau:

Sự kiện này không áp dụng toàn máy chủ, chỉ tài khoản may mắn mới nhận được vật phẩm ưu đãi.
Mỗi tài khoản chỉ có thể mua 1 gói ưu đãi duy nhất.
Gói ưu đãi chỉ có thể mua 1 lần.
Số lượng vật phẩm và giá khuyến mãi có thể ngẫu nhiên theo tài khoản.
Vật phẩm có thể sẽ mất 1 lúc để gửi đến tài khoản.
Trong trường hợp quá lâu mà chưa nhận được vật phẩm, vui lòng liên hệ CSKH', N'aaa', CAST(N'2020-03-22' AS Date), 2, N'sunahajung')
INSERT [dbo].[Post] ([postID], [title], [shortDesc], [longDesc], [imgLink], [date], [TopicID], [writer]) VALUES (23, N'TOP 5 tướng bị giảm sức mạnh bản 10.5: Quái vật Đường Trên Sett và Ornn lên thớt', N'Ornn bị giảm sức mạnh khá đáng kể rồi đó', N'Thứ đáng quan tâm nhất chính là khả năng nâng cấp đồ cho bản thân lẫn đồng đội đều bị tăng thêm 1 cấp, khiến cho ngưỡng sức mạnh về cuối trận của vị tướng này đến chậm hơn. Một thứ khác cũng cần chỉnh sửa, đó là khả năng gây sát thương của Ornn quá ghê trong khi hắn ta chỉ là một vị tướng chống chịu, và vì thế khả năng gây sát thương theo phần trăm máu tối đa từ hiệu ứng Nóng Gión cũng bị giảm khoảng 2% – một con số khá đáng kể. Nhìn chung thì Ornn vẫn là một sự lựa chọn rất đáng sử dụng và sẽ còn xuất hiện nhiều trong đấu trường chuyên nghiệp, chỉ là hắn bớt bá đạo hơn một chút thôi.', N'\Images\avatar-ornn.jpg', CAST(N'2020-03-27' AS Date), 2, N'apelios')
INSERT [dbo].[Post] ([postID], [title], [shortDesc], [longDesc], [imgLink], [date], [TopicID], [writer]) VALUES (25, N'KT Kuro: “Chẳng có gì xấu khi mơ lớn cả, thế nên tôi muốn có chuỗi 13 trận thắng”', N'Sau chuỗi 5 trận thua là 5 chiến thắng liên tiếp của KT', N'Ngày 25 vừa qua, KT Rolster đã gặp lại DAMWON Gaming ở lượt về vòng bảng LCK Mùa Xuân 2020. Với chiến thắng 2-1 có được, KT đang có cho mình chuỗi 5 trận thắng liên tiếp với hiệu số 5-5, và họ cũng đang đứng thứ 5 trên bảng xếp hạng. Kuro đã có một màn trình diễn tuyệt vời với Rumble ở ván đấu thứ 3, ván đấu mà anh ấy đã gây gần 15k sát thương lên đối thủ. Ưu điểm là chúng tôi thấy bớt lo lắng hơn vì được thi đấu ở trong một nơi quen thuộc như vậy. Tuy nhiên, vì cảm giác nó giống như đang đấu tập, thế nên các đội cũng có vẻ như chơi giống như đấu tập hơn, nó thoải mái hơn, và chúng tôi cũng gặp phải những tình huống bất ngờ mà chúng tôi thường không mong gặp phải khi thi đấu ở LoL Park. Về cá nhân tôi vẫn thích được thi đấu ở LoL Park hơn.<br><img class="picture1" src="Images/kt.jpg" /><br>Khi đội đang trong chuỗi thua, chúng tôi đã đùa rằng, ‘Giờ chúng ta chỉ cần có được chuỗi thắng nữa thôi’. Nếu tiếp tục chuỗi thắng, chúng tôi không chỉ có thể lọt vào vòng play-off, mà còn có cơ hội đến CKTG nữa. Chẳng có gì xấu khi mơ lớn cả, thế nên tôi muốn có chuỗi 13 trận thắng.Đại dịch Corona ảnh hưởng đến cuộc sống hàng ngày lớn hơn tôi nghĩ. Với mọi người ở nhà, hãy nhớ đeo khẩu trang, và hy vọng điều này sớm kết thúc để tôi có thể nhanh chóng gặp lại tất cả các bạn.', N'\Images\r1585135210202496.jpeg', CAST(N'2020-03-28' AS Date), 1, N'phamtien')
INSERT [dbo].[Post] ([postID], [title], [shortDesc], [longDesc], [imgLink], [date], [TopicID], [writer]) VALUES (26, N'Cẩm nang kiểm soát thế lính khi đi đường (Phần 1)', N'Đóng băng lính lợi lắm đó!!', N'Như đã nói ở trong cẩm nang “Những điều chú ý khi đi đường”, Liên Minh 360 sẽ giới thiệu với các bạn cách kiểm soát các đợt lính, một kỹ năng rất quan trọng giúp các bạn có thể dễ dàng làm chủ đường của mình hơn. Vậy hãy bắt đầu thôi!

Kiểm soát đợt lính là kỹ năng quan trọng và mang lại nhiều lợi ích cho người chơi trong Liên Minh Huyền Thoại. Để làm chủ đường của mình, kiểm soát đợt lính là điều bắt buộc mỗi game thủ cần biết. Rất nhiều người chơi không hiểu về khái niệm này và dẫn đến thua đường cũng như bỏ lỡ những cơ hội để vượt lên trước đối thủ. Trong bài viết này, Liên Minh 360 sẽ giới thiệu các phương pháp để kiểm soát thế lính. Kiểm soát đợt lính yêu cầu sự tỉ  mỉ và chính xác tuyệt đối, chỉ cần một sai sót nhỏ cũng khiến bạn phải làm lại từ đầu. Trong quá trình thực hành có thể bạn sẽ thất bại rất nhiều lần, nhưng đừng nản chí. Khi kiểm soát thành thục các đợt lính, bạn sẽ chơi Liên Minh Huyền Thoại tốt hơn nhiều đấy.', N'\Images\avatar-siege-minion-xe-phao.jpg', CAST(N'2020-03-27' AS Date), 3, N'phamtien')
INSERT [dbo].[Post] ([postID], [title], [shortDesc], [longDesc], [imgLink], [date], [TopicID], [writer]) VALUES (29, N'Phá cách cực mạnh với Ezreal phép ở vị trí Hỗ Trợ', N'Bắn tỉa cực khó chịu', N'Ezreal sức mạnh phép thuật không phải là một lối chơi quá xa lạ, nhưng điểm yếu của phong cách chơi này là dọn lính quá tệ nên nếu sử dụng để đi đường sẽ gặp nhiều bất lợi. Nhưng khi Ezreal AP ở vị trí Hỗ Trợ lại là một lối chơi thú vị, khi mà người chơi có thể tận dụng lợi thế cấu rỉa siêu mạnh của hắn mà không cần quan tâm gì tới việc farm. Hãy cùng đi tìm hiểu kĩ hơn nhé!.Ở cấp độ đầu tiên thì Ezreal vẫn tăng vào kĩ năng Q để có khả năng cấu rỉa tốt nhất, cấp 2 và 3 cộng điểm vào E cùng W còn lấy cái nào trước thì tùy thuộc vào lối chơi mỗi người. Nhưng đương nhiên, với Ezreal sức mạnh phép thuật thì hắn ta sẽ cần nâng tối đa vào W, nên sau cấp độ 3 đây sẽ là kĩ năng quan trọng nhất. Thậm chí chiêu Q cũng chỉ nâng tối đa cuối cùng khi mà nó không đem tới nhiều sát thương trong lối chơi Ezreal AP, thay vào đó tăng vào E sẽ giúp Ezreal trở nên cơ động hơn hẳn.<br><img class="picture1" src="Images/avatar-ezreal-600x338.jpg" /><br>Vì Ezreal không hề có kĩ năng khống chế nào, nên bạn sẽ phải có khả năng gây sát thương tốt để có thể có ích cho cả đội. Với việc hoàn thành được những món trang bị chính như Mũ Phù Thủy hay Vọng Âm Luden thì Ezreal hoàn toàn có thể one shot được những tướng yếu máu về cuối trận.', N'\Images\avatar-ezreal.jpg', CAST(N'2020-03-28' AS Date), 3, N'phamtien')
INSERT [dbo].[Post] ([postID], [title], [shortDesc], [longDesc], [imgLink], [date], [TopicID], [writer]) VALUES (30, N'Để Caps chơi ở vị trí xạ thủ liệu có phải là một quyết định đúng đắn?', N'Liệu Caps đã chứng tỏ được năng lực của mình ở vị trí xạ thủ?', N'Thật khó có thể bỏ lỡ và rời mắt khỏi được những trận đấu của G2 Esports.

Đó là một điều hiển nhiên khi đây là một trong những đội tuyển tài năng nhất mà châu âu từng sản sinh ra. Chúng ta yêu mến họ không chỉ bởi sức mạnh hay những tình huống xử lý chất lượng của họ mà còn là sự thú vị và những quyết định có phần điên rồ của họ. Họ hiểu rằng họ có thể mạnh hơn tất cả, họ biết rằng họ có những tuyển thủ hàng đầu trong mọi vị trí và luôn tự tin khi đối đầu với bất cứ đối thủ nào.Quay trở lại khi Luka “Perkz” Perković quyết định chuyển xuống làm xạ thủ, không ai có thể đoán được rằng G2 sẽ tìm thấy nhiều thành công đến như vậy. Cho tới bây giờ, anh ấy là một trong những người đi đường giữa giỏi nhất và tài năng nhất trong lịch sử châu âu, nhưng để có thể sử dụng một lượng tướng hoàn toàn mới cùng phong cách chơi cũng rất khác là một thách thức lớn, ngay cả đối với một người chơi tầm cỡ của anh ấy.

Dù vậy, tuyển thủ tài năng này vẫn biết cách để có thể thích nghi, giống như anh vẫn luôn làm trước đó. Cho đến khi mùa giải vừa rồi kết thúc, Perkz thực sự là một trong những xạ thủ xuất sắc nhất châu âu, khả năng vượt qua khó khăn và tỏa sáng vào những thời khắc mà đồng đội cần đến nhất vẫn luôn được anh thể hiện dù ở trong một vị trí mới.

Sau thất bại trước FPX tại trận chung kết của Chung Kết Thế Giới, G2 lại đưa ra một quyết định vô cùng táo bạo khiến mọi người đều vô cùng ngỡ ngàng: Perkz sẽ trở lại vị trí quen thuộc của mình ở đường giữa trong khi Rasmus “Caps” Winther sẽ thử sức mình ở vị trí hoàn toàn lạ lẫm với anh ấy – xạ thủ.

', N'\Images\Caps-midlane-argument-LoL-1140x570.jpg', CAST(N'2020-03-28' AS Date), 1, N'phamtien')
INSERT [dbo].[Post] ([postID], [title], [shortDesc], [longDesc], [imgLink], [date], [TopicID], [writer]) VALUES (31, N'Một ngày làm việc của trọng tài Yuli ở LEC', N'Đằng sau những sản phẩm chất lượng là đội ngũ những con người sáng tạo và chịu khó. Yuli, trọng tài gốc Nga của LEC đã đứng sau những tuyển thủ châu Âu.', N'Tôi nghĩ khoảnh khắc đó là cơ hội tốt nhất của mình. Nếu không lúc này thì lúc nào? Quan niệm sống của tôi là: Nếu bạn không thử, bạn sẽ không thể biết được. Tôi không bắt đầu với công việc trọng tài, tôi làm ở khu vực lối vào trước, chào đón khách hướng dẫn họ cất túi và áo khoác. Khoảng 2 tuần sau, có người đến rồi bảo tôi: “Chúng tôi đang tìm người có thể trông coi các tuyển thủ. Cô đã làm rất tốt ở đây, vậy cô có muốn làm trọng tài không?”, tôi nói có và công việc trọng tài gắn bó với tôi từ đó đến giờ. Hôm nay tôi đến đây lúc 4h30 chiều. Chúng tôi thường có mặt khá sớm trước khi chương trình bắt đầu. Sau đó chúng tôi đọc về công việc hôm nay cũng như ăn trưa. Trong khi dùng bữa, chúng tôi nói về ngày hôm nay có thể xảy ra những lỗi gì trong trận, những thứ cần lưu ý khác. Nói chung, ở đây không khí rất thân thiện và thoải mái những cũng rất nghiêm túc. Sau đó chúng tôi thiết lập sân khấu cho các đội bằng cách chuẩn bị bàn phím, chuột – đó là những gì mà một trọng tài phải làm.Sau đó chúng tôi đợi các tuyển thủ đến. Kiếm tra họ trước khi họ lên sân khấu vì họ không được phép mang thiết bị điện tử lên sân khấu. Mọi chuyện tương tự như ở sân bay vậy. Chúng tôi cũng có máy quét đấy. Khi họ lên sân khấu, chúng tôi có khoảng 15-30 phút để giúp họ. Họ vào game và kiểm tra máy, cài đặt, âm lượng và ánh sáng sân khấu. Nếu có vấn đề gì, chúng tôi là người đầu tiên được biết.', N'\Images\yuli-lec.jpg', CAST(N'2020-03-28' AS Date), 1, N'phamtien')
INSERT [dbo].[Post] ([postID], [title], [shortDesc], [longDesc], [imgLink], [date], [TopicID], [writer]) VALUES (32, N'CHÍNH THỨC: Mid Season Invitational 2020 sẽ khởi tranh từ ngày 3/7', N'[THÔNG BÁO TỪ RIOT GAMES VỀ MID SEASON INVITATIONAL 2020]', N'Sau khi thảo luận với các đại diện cái giải đấu và các bên liên quan, chúng tôi đã đưa ra quyết định dời giải đấu MSI hằng năm từ tháng Năm sang tháng Bảy trong năm nay. Dời lịch giải đấu giúp tăng khả năng các giới hạn đi lại sẽ được bãi bỏ, cho phép các đội tuyển từ các giải đấu di chuyển và thi đấu một cách an toàn hơn. Giải đấu sẽ bắt đầu từ Thứ Sáu, ngày 3/7 và kết thúc và Chủ Nhật, 19/7.

Địa điểm và các chi tiết khác sẽ được đăng tải sớm nhất có thể, dù mọi thứ ở hiện tại chỉ là dự kiến bởi tình trạng dịch COVID-19 vẫn đang ảnh hưởng nặng nề đến việc di chuyển quốc tế và các sự kiện trực tiếp của mọi môn thể thao và ngành giải trí. Dù vậy, chúng tôi sẽ đảm bảo rằng MSI vẫn sẽ là một trải nghiệm toàn cầu ấn tượng như mọi năm.

Để đáp ứng với thay đổi này, và đảm bảo ít xáo trộn nhất đối với phần còn lại trong lịch trình năm, chúng tôi đã có một số thay đổi về ngày khởi tranh Giải Mùa Hè của các khu vực trên thế giới, và chúng sẽ bắt đầu trước MSI. Sau đây là lịch khởi tranh của các giải khu vực trên thế giới:

OPL – 15/5
VCS – 15/5
LCS – 16/5
TCL – 16/5
LCK – 20/5
LEC – 22/5
CBLOL – 23/5
LPL – 23/5
PCS – 30/5
LLA – 30/5
LJL – 31/5
LCL – 6/6', N'\Images\89084028_1546411538870490_5066766888957116416_o-1280x720.jpg', CAST(N'2020-03-28' AS Date), 1, N'phamtien')
INSERT [dbo].[Post] ([postID], [title], [shortDesc], [longDesc], [imgLink], [date], [TopicID], [writer]) VALUES (33, N'kt Aiming hướng về chuỗi 13 trận thắng liên tiếp: “Nếu T1 làm được nó thì không lí gì chúng tôi không làm được.”', N'kt Rolster vừa có được  chiến thắng 2-0 dễ dàng trước Hanwha Life Esports.', N'Thực sự tôi muốn được thi đấu trực tiếp ở trên sàn đấu. Điều duy nhất mà thi đấu trực tuyến đem lại cho tôi là sự thoải mái khi được sử dụng những thiết bị quen thuộc đã được chuẩn bị sẵn. Tuy nhiên, tôi sẽ cố gắng để làm quen với hình thức thi đấu này. Có cảm giác như đây là sự kết hợp giữa đấu tập và thi đấu chính thức vậy. Chúng tôi đã gặp đôi chút vấn đề về việc trao đổi và điều đó khiến chúng tôi gặp phải đôi chút bất lợi nhưng chúng tôi tự tin rằng mình có thể giành được chiến thắng chúng cuộc. Chúng tôi đã lấy lại được thế trận nhờ việc tận dụng những sai lầm của đối thủ và cùng nói với nhau rằng hãy chơi chậm lại. Tôi biết rằng khi LeeSin đang phá con mắt của tôi, anh ấy sẽ tấn công tôi ngay sau đó. Vậy nên, tôi hiểu rằng mình cần phải rút lui nhưng không ngờ anh ấy lại đu theo mình, đó thực sự là một tình huống may mắn.', N'\Images\49501184222_c83c854c9e_h.jpg', CAST(N'2020-03-28' AS Date), 1, N'phamtien')
INSERT [dbo].[Post] ([postID], [title], [shortDesc], [longDesc], [imgLink], [date], [TopicID], [writer]) VALUES (35, N'T1 Effort: “Từ đi đường đến giao tranh thì Kalista – Taric không có điểm yếu nào cả”', N'T1 đã giành chiến thắng xứng đáng trước DragonX ở tuần đấu thứ 6 LCK', N'Vì chúng tôi đang cạnh tranh trực tiếp với DragonX trên bảng xếp hạng, nên tôi cảm thấy có chút áp lực. Các ván đấu đều không dễ dàng nên hơi mệt mỏi. Chúng tôi nghĩ đội hình này tốt cho những pha giao tranh Rồng sớm và sẽ không có vấn đề gì nếu có những bùa lợi này về cuối trận. Một khoảng thời gian khá dài chúng tôi không sử dụng tướng không phải xạ thủ đường dưới, nhưng tôi nghĩ đây là lựa chọn tốt. Chúng tôi đã thiết lập được những tình huống có lợi và có thể kết thúc nhanh ván đấu. Teddy không chỉ sử dụng tốt những tướng không phải xạ thủ mà anh ấy rất giỏi chơi LMHT. Anh ấy chơi giỏi tất cả các vị tướng.<br><img class="picture1" src="Images/49500583317_96d9d16b56_c.jpg" /><br>Tôi cảm ơn người hâm mộ đã cổ vũ chúng tôi ngay cả khi đội thi đấu online. Chúng tôi sẽ đáp lại bằng những kết quả tốt. Xin hãy tiếp tục cổ vũ cho T1.', N'\Images\49528508903_e6218a8666_c-300x200.jpg', CAST(N'2020-03-28' AS Date), 1, N'phamtien')
INSERT [dbo].[Post] ([postID], [title], [shortDesc], [longDesc], [imgLink], [date], [TopicID], [writer]) VALUES (36, N'Cập nhật ĐTCL bản 10.5: Zed và Lux trở nên vô địch khi lên được 3 sao', N'Bản cập nhật cuối cùng của Nguyên Tố Trỗi Dậy', N'Xin chào,

Đây sẽ là phiên bản cuối cùng của Nguyên Tố Trỗi Dậy. Trong mục cân bằng, chúng tôi sẽ nâng cấp sức mạnh của một số vị tướng ở cấp 3 sao. Nói ngắn gọn thì, nếu nhân phẩm bạn đủ tốt để tìm được Lux 3 sao, bạn có rất rất nhiều khả năng sẽ có top 1.

Ngoài ra, đây sẽ là phiên bản cuối cùng để bạn cày xếp hạng trước khi nó được reset khi Vô Hạn Thiên Hà cập bến. Vì thế, nếu bạn đang nhắm đến một bậc xếp hạng cao hơn thì bạn có hai tuần nữa để đạt được nó đấy.

Đây là hành trình kì diệu dẫn đến Chi Tiết Phiên Bản Liên Minh Huyền Thoại!

Giờ thì bắt đầu thôi!Lượng Hỏa Cầu Diana: 3/4/5 ⇒ 3/4/6
Lượng Cây Zyra: 2/3/4 ⇒ 2/3/5
Sát Thương Kĩ Năng Rek’Sai: 250/550/850 ⇒ 250/550/1000
Sát Thương Kĩ Năng Mundo: 50/100/150 ⇒ 50/100/200
Giảm Năng Lượng Bóng của Zed: 50/25/0 ⇒ 50/25/-125. Xung quanh toàn là Zed.
Sát Thương Kĩ Năng Lux: 550/900/9,999 ⇒ 550/900/99,999', N'\Images\zed-1095x720.jpg', CAST(N'2020-03-28' AS Date), 2, N'phamtien')
INSERT [dbo].[Post] ([postID], [title], [shortDesc], [longDesc], [imgLink], [date], [TopicID], [writer]) VALUES (37, N'Cập nhật ĐTCL bản 10.6: Mùa 3 Vô Hạn Thiên Hà đã tới', N'Xếp Hạng của bản Vô Hạn Thiên Hà sẽ bắt đầu ngay sau khi cập nhật hoàn tất.', N'Thời gian chuẩn bị mỗi vòng đấu được tăng thêm 5 giây để giúp mọi người làm quen dễ hơn. Thay đổi này sẽ bị loại bỏ trong phiên bản 10.7
Vết Thương Sâu: Giảm 80% hồi phục ⇒ Giảm 50% hồi phục
Giải Giới sẽ không còn khiến đối phương không thể dùng kĩ năng, chỉ cấm đánh thôi.
Mọi tướng trong trò chơi đều sẽ được hưởng lợi từ chỉ số SMPT. Xem chi tiết trong mô tả kĩ năng tướng.
Luật trang bị khi ghép tướng: Khi nâng sao tướng, trang bị từ các tướng thành phần sẽ ghép vào tướng được tăng sao: 1) Găng Đạo Tặc 2) Trang Bị Hoàn Chỉnh Ngẫu Nhiên 3) Trang Bị Thành Phần Ngẫu Nhiên.
Sửa Lỗi: Tướng ở 3 sao giờ sẽ to hơn tướng ở 2 sao
Sửa Lỗi: Sửa lỗi tướng có tốc độ đánh quá nhanh đôi khi sẽ khiến đạn biến mất giữa đường bay.
Sửa Lỗi: Sửa một lỗi khi tướng nhận được quá nhiều tốc độ đánh, họ sẽ bị mất đồng bộ giữa đòn đánh và hoạt ảnh thực sự.Đừng ngạc nhiên khi thấy mấy cái bảng giới thiệu Vé Thiên Hà lần đầu tiên bạn vào game. Với những người đọc chi tiết phiên bản thường xuyên thì hẳn là phần này không cần rồi, nhưng cứ đọc đi cho tui vui nha!
Nếu bạn mua Vé Thiên Hà+, bạn sẽ có thể nhận tiếp các phần thưởng thêm một khi đã hoàn thành hết vé. Số điểm cần đạt để nhận chúng không ít tí nào đâu, nên chúng chỉ dành cho những ai thực sự chơi RẤT NHIỀU ĐTCL', N'\Images\TFT.S3_GALAXIES.ARTICLE-2.jpg', CAST(N'2020-03-28' AS Date), 2, N'phamtien')
INSERT [dbo].[Post] ([postID], [title], [shortDesc], [longDesc], [imgLink], [date], [TopicID], [writer]) VALUES (39, N'Một vài thông tin về các đội tuyển tham dự PCS 2020', N'Pacific Championship Series (PCS) là một giải đấu hợp nhất giữa League Master Series (LMS) của khu vực Đài Loan và League of Legends Southeast Asia Tour', N'Những người tổ chức cũng như điều hành PCS 2020 sẽ bao gồm Riot Games, Funplus Esports cùng với Garena, nhà phát hành game LMHT của Đài Loan, Hong Kong cũng như Đông Nam Á. Mục tiêu năm nay của giải đấu là hợp tác với các đội nhằm phát triển lượng người xem trong khi chờ đợi những cơ hội bổ sung về tài chính. Hình thức tổ chức của PCS cũng sẽ khác với LST hay LMS trước đây. Nhận thấy sự phát triển và thành công của các giải đấu mà vòng bảng đánh theo kiểu bo1, các nhà tổ chức hi vọng người hâm mộ có thể thưởng thức trận đấu của đội họ yêu thích mỗi ngày. Số lượng trận đấu cũng sẽ nhiều hơn cũng như vòng playoff kép để đảm bảo những đội tuyển mạnh nhất của giải đấu đến với đấu trường quốc tế.Sau một quá trình tuyển chọn gắt gao, cuối cùng các nhà tổ chức đã chọn ra những cái tên xứng đáng nhất để đến với PCS 2020. Trong số những đội tuyển này, có những cái tên lần đầu bén duyên với Liên Minh Huyền Thoại nhưng họ đã chứng minh vị thế của mình trong những lĩnh vực Esports khác và được công nhận. Hãy cùng điểm qua 9 cái tên sau đây nhé! Những trận đấu của PCS sẽ được phát sóng trực tiếp bằng tiếng Anh, tiếng Trung và tiếng Thái thông qua một số kênh của nhà tổ chức. Trận khai mạc của giải đấu sẽ diễn ra vào 8 tháng 2 năm 2020 tới đây. Hãy chờ đợi và đón xem những thông tin tiếp theo về giải đâu thú vị này nhé!', N'\Images\lQfMEBD-1280x720.jpg', CAST(N'2020-03-28' AS Date), 1, N'phamtien')
SET IDENTITY_INSERT [dbo].[Post] OFF
INSERT [dbo].[Team] ([TeamID], [Name], [Score], [AreaID]) VALUES (N'C9        ', N'Cloud9', 12, N'LCS       ')
INSERT [dbo].[Team] ([TeamID], [Name], [Score], [AreaID]) VALUES (N'CLG       ', N'Counter Logic Gaming', 4, N'LCS       ')
INSERT [dbo].[Team] ([TeamID], [Name], [Score], [AreaID]) VALUES (N'DGX       ', N'Kingzone Dragon X', 8, N'LCK       ')
INSERT [dbo].[Team] ([TeamID], [Name], [Score], [AreaID]) VALUES (N'EDG       ', N'Edward Gaming', 6, N'LPL       ')
INSERT [dbo].[Team] ([TeamID], [Name], [Score], [AreaID]) VALUES (N'EVOS      ', N'EVOS Esport', 5, N'VCS       ')
INSERT [dbo].[Team] ([TeamID], [Name], [Score], [AreaID]) VALUES (N'EX        ', N'Excel Gaming', 7, N'LEC       ')
INSERT [dbo].[Team] ([TeamID], [Name], [Score], [AreaID]) VALUES (N'FL        ', N'Team Flash', 7, N'VCS       ')
INSERT [dbo].[Team] ([TeamID], [Name], [Score], [AreaID]) VALUES (N'FLQ       ', N'FlyQuest', 8, N'LCS       ')
INSERT [dbo].[Team] ([TeamID], [Name], [Score], [AreaID]) VALUES (N'FNC       ', N'Fnatic', 8, N'LEC       ')
INSERT [dbo].[Team] ([TeamID], [Name], [Score], [AreaID]) VALUES (N'G2        ', N'G2 Esport', 10, N'LEC       ')
INSERT [dbo].[Team] ([TeamID], [Name], [Score], [AreaID]) VALUES (N'GAM       ', N'GAM Esport', 10, N'VCS       ')
INSERT [dbo].[Team] ([TeamID], [Name], [Score], [AreaID]) VALUES (N'GG        ', N'GenG', 9, N'LCK       ')
INSERT [dbo].[Team] ([TeamID], [Name], [Score], [AreaID]) VALUES (N'GRF       ', N'Grifin', 4, N'LCK       ')
INSERT [dbo].[Team] ([TeamID], [Name], [Score], [AreaID]) VALUES (N'IG        ', N'Invictus Gaming', 8, N'LPL       ')
INSERT [dbo].[Team] ([TeamID], [Name], [Score], [AreaID]) VALUES (N'IMT       ', N'Immortal', 5, N'LCS       ')
INSERT [dbo].[Team] ([TeamID], [Name], [Score], [AreaID]) VALUES (N'KT        ', N'KT Rolster', 6, N'LCK       ')
INSERT [dbo].[Team] ([TeamID], [Name], [Score], [AreaID]) VALUES (N'MF        ', N'Misfit Gaming', 5, N'LEC       ')
INSERT [dbo].[Team] ([TeamID], [Name], [Score], [AreaID]) VALUES (N'QG        ', N'QTV Gaming', 5, N'VCS       ')
INSERT [dbo].[Team] ([TeamID], [Name], [Score], [AreaID]) VALUES (N'RNG       ', N'Royal Never Give Up', 10, N'LPL       ')
INSERT [dbo].[Team] ([TeamID], [Name], [Score], [AreaID]) VALUES (N'SN        ', N'Sunning Gaming', 4, N'LPL       ')
INSERT [dbo].[Team] ([TeamID], [Name], [Score], [AreaID]) VALUES (N'T1        ', N'SKT T1', 10, N'LCK       ')
INSERT [dbo].[Team] ([TeamID], [Name], [Score], [AreaID]) VALUES (N'TS        ', N'Team Secret', 6, N'VCS       ')
INSERT [dbo].[Team] ([TeamID], [Name], [Score], [AreaID]) VALUES (N'TSM       ', N'Team SoloMid', 7, N'LCS       ')
INSERT [dbo].[Team] ([TeamID], [Name], [Score], [AreaID]) VALUES (N'VCG       ', N'Vici Gaming', 2, N'LPL       ')
INSERT [dbo].[Team] ([TeamID], [Name], [Score], [AreaID]) VALUES (N'VLT       ', N'Viltality', 6, N'LEC       ')
SET IDENTITY_INSERT [dbo].[Topic] ON 

INSERT [dbo].[Topic] ([ID], [TopicName]) VALUES (1, N'Esport')
INSERT [dbo].[Topic] ([ID], [TopicName]) VALUES (2, N'Game')
INSERT [dbo].[Topic] ([ID], [TopicName]) VALUES (3, N'Trick')
SET IDENTITY_INSERT [dbo].[Topic] OFF
ALTER TABLE [dbo].[comment]  WITH CHECK ADD  CONSTRAINT [FK_comment_Account] FOREIGN KEY([account ID])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[comment] CHECK CONSTRAINT [FK_comment_Account]
GO
ALTER TABLE [dbo].[comment]  WITH CHECK ADD  CONSTRAINT [FK_comment_Post] FOREIGN KEY([postID])
REFERENCES [dbo].[Post] ([postID])
GO
ALTER TABLE [dbo].[comment] CHECK CONSTRAINT [FK_comment_Post]
GO
ALTER TABLE [dbo].[Gamer]  WITH CHECK ADD  CONSTRAINT [FK_Gamer_Team] FOREIGN KEY([TeamID])
REFERENCES [dbo].[Team] ([TeamID])
GO
ALTER TABLE [dbo].[Gamer] CHECK CONSTRAINT [FK_Gamer_Team]
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [FK_Post_Department] FOREIGN KEY([TopicID])
REFERENCES [dbo].[Topic] ([ID])
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [FK_Post_Department]
GO
ALTER TABLE [dbo].[Team]  WITH CHECK ADD  CONSTRAINT [FK_Team_Area] FOREIGN KEY([AreaID])
REFERENCES [dbo].[Area] ([id])
GO
ALTER TABLE [dbo].[Team] CHECK CONSTRAINT [FK_Team_Area]
GO
USE [master]
GO
ALTER DATABASE [DBLOL] SET  READ_WRITE 
GO
