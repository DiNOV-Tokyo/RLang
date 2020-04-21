# カイ二乗検定（独立性の検定）

# データの準備
dat<-c(86, 32, 92, 24, 22, 123, 42, 105, 31, 43)
DF<-as.data.frame(matrix(dat, 5, 2, byrow=F))
colnames(DF)<-c("依存症である", "依存症でない")
rownames(DF)<-c("ビール", "日本酒", "焼酎", "ウイスキー", "ワイン")

# モザイクプロットで眺めてみる
mosaicplot(DF, xlab="酒の種類", ylab="アルコール依存",  shade=TRUE, main="酒の種類・アルコール依存")

# 手動でカイ二乗検定
# 各行の合計を求める
r_sum<-c()  
for (i in row(DF)){
  r_sum[i]<-sum(DF[i,])
}
# 各列の合計を求める
c_sum<-c()  
for (j in col(DF)){
  c_sum[j]<-sum(DF[,j])
}
# 全合計
t_sum<-sum(c_sum)
# 期待値を計算
E_DF<-data.frame()
for (i in row(DF)){
  for (j in col(DF)){
    E_DF[i, j]<-r_sum[i] * c_sum[j] / t_sum
  }
}

# 検定統計量Tの計算
T<-sum((DF-E_DF)*(DF-E_DF)/E_DF)

# 自由度４(=(5-1)×(2-1)), 有意水準5%のカイ二乗値を求める。
qchisq(0.95, 4)


# Rの関数を使って計算
chisq.test(DF)

