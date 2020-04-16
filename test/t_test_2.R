#データ生成
city_a <- rnorm(n=200, mean=20, sd=5.1) #正規分布の架空データ　都市AのPM2.5飛散量
city_b <- rnorm(n=200, mean=25.3, sd=5.4) #正規分布の架空データ　都市BのPM2.5飛散量

#ヒストグラムで確認
layout(matrix(1:2, 1, 2))
hist(city_a, breaks=seq(0,50,2.5), xlab="range", xlim=c(0,50), ylim=c(0,50))
hist(city_b, breaks=seq(0,50,2.5), xlab="range", xlim=c(0,50), ylim=c(0,50))

# 正規性の検定
shapiro.test(city_a)  
shapiro.test(city_b)

#分散性の検定
var.test(city_a, city_b)

#t 検定
t.test(city_a, city_b, var.equal = T)

dat_a<-data.frame("City"=c(rep("city_a", length(city_a))), "Val"=city_a)
dat_b<-data.frame("City"=c(rep("city_b", length(city_b))), "Val"=city_b)
dat<-rbind(dat_a, dat_b)

# 2つのヒストグラムをまとめて表示
library(ggplot2)
ggplot(dat) + #データフレーム指定
  geom_histogram(aes(x=dat$Val, fill=dat$City),  #描画対象の変数
                 position="identity", #重ねて描画
                 alpha=0.5,
                 bandwidth=2) +
  scale_fill_manual(values=c("green", "orange")) +
  labs(x="Amount of PM2.5")
  
