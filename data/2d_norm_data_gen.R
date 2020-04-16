# [R]正規分布に従う2次元データの作り方
# http://rplus.wb-nahce.info/rsemi_stat_basic/r_nijigendata.html

#　統計検定2級　2015年11月　問３　[8]　のシミュレーションデータ生成

library(MASS)					# MASSパッケージの読込
Mu <- c(56, 59.1)					# 平均値ベクタ
Si <- matrix(c(236.6, 133.1, 133.1, 170.1), ncol=2)		# 分散共分散行列
dat <- mvrnorm(300, Mu, Si)			# データの生成
#dat <- data.frame(x=dat[,1], y=dat[,2])		# 扱いやすく加工
#dat
#plot(dat, xlim=c(0, 100), ylim=c(0, 100))
plot(x=dat[,1], y=dat[,2], xlab="国語", ylab="英語", xlim=c(0, 100), ylim=c(0, 100))
cor(dat)