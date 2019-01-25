        options(stringsAsFactors = FALSE)
  
  #library("tidyverse")
  
  library("data.table") # 파일 입출력
  library("dplyr")      # 데이터 핸들링
  library("reshape2")   # 데이터 핸들링
  library("agricolae")  # ANOVA 사후 검저(duncan.test)
  library("e1071")      # 머신러닝 + 첨도 + 왜도  
  
  
  ##### 1. 파일 불러오기 #####
  file_list = list.files(pattern = "^ds") # ds 로 시작하는 파일명 
  file_list
  
  cust = fread(file_list[1], data.table = FALSE, encoding = "UTF-8")
  prod = fread(file_list[2], data.table = FALSE, encoding = "UTF-8")
  purchase = fread(file_list[3], data.table = FALSE, encoding = "UTF-8")
  
  head(cust, 2)
  head(prod, 2)
  head(purchase, 2)
  
  #  성별, 연령, 가입일자 처리
  cust[, "age"] = as.numeric(gsub(pattern="[^0-9]", replacement="", x=cust$age_gender))
  cust[, "gender"] = gsub(pattern="[^A-Z]", "", x=cust$age_gender)
  head(cust)                  
  
  # 고객수 확인
  length(unique(cust$cust_no))
  
  # Q1. 두번이상 기록된 고객을 제외한 나머지 고객정보를
  # cust_sub 에 저장하시오.
  # 힌트) split 함수를 쓰지 않는다.
  # 힌트) table 함수를 쓴다.
  #?table
  ### table 함수로 cust_no 의 Freq (빈도)를 구한다.
  table(cust$cust_no)
  
  cust_table = as.data.frame(table(cust$cust_no))
  head(cust_table, 2)
  
  #### Freq==1 인 넘들만 cust_sub에 넣는다.
  cust_table= cust_table[cust_table$Freq == 1, ]
  cust_sub = cust[cust$cust_no %in% cust_table$Var1, ]
  
  # Q2. 두번이상 기록된 고객의 비중은?
  cust_cnt = length(unique(cust$cust_no))
  cust_sub_cnt = length(unique(cust_sub$cust_no))
  
  (cust_cnt - cust_sub_cnt) / cust_cnt
  (cust_cnt - cust_sub_cnt) / cust_cnt * 100
  
  #### ★중복 제거 #####
  head(cust)
  cust = cust[order(cust$cust_no, -cust$update_dt, -cust$age), ]
  head(cust, 30)
  
  ### List로 뽑는다.
  cust_split= split(cust, f = cust$cust_no)
  #cust_split[10000:10004]
  
  ?lapply
  
  cust_split= lapply(cust_split, FUN = function(x){x[1, ]})
  cust =bind_rows(cust_split)
  head(cust, 10)
  
  length(unique(cust$cust_no) == nrow(cust))
  # Join ====================
  head(purchase)
  base_table = left_join(x = purchase, y = cust, by = c("cust_no"= "cust_no"))
  base_table = left_join(x = base_table, y = prod, by = c("item_no"= "item_no"))
  head(base_table , 5)
  
  ### [[문제]]] ==> 1당 매출금액 
  agg_sales = aggregate(data = base_table, 
                        item_amt ~ gender + item_ctg1,
                        FUN = "sum")
  head(agg_sales)
  
  base_sub = unique(base_table[ , c("cust_no", "gender", "item_ctg1")])
  head(base_sub)
  
  nrow(base_sub)
  nrow(base_table)
  
  ###(방법 1)
  agg_cnt = aggregate(data = cbind(base_sub, cnt = 1),
                      cnt ~ gender + item_ctg1,
                      FUN = "sum")
  head(agg_cnt)
  
  ###(방법 2)
  base_sub[ , "cnt"] = 1
  agg_cnt = aggregate(data = base_sub, 
                      cnt ~ gender + itme_ctg1,
                      FUN = "sum")
  head(base_sub)
  
  
  head(agg_cnt)
  head(agg_sales)
  
  ## 병합
  #1
  agg_total = cbind(agg_sales, cnt = agg_cnt$cnt)
  #2
  agg_sales[ , "cnt"] = agg_cnt$cnt
  head(agg_sales)
  #3
  agg_sales[ , "cnt"] = aggregate(data = cbind(base_sub, cnt = 1),
                                  cnt ~ gender + item_ctg1,
                                  FUN = "sum")[, 3]
  head(agg_sales)
  
  # 4 
  agg_total = left_join(x = agg_sales, y = agg_cnt, 
                        by = c("gender" = "gender", "item_ctg1" = "item_ctg1"))
  
  head(agg_total)
  
  
  agg_total[ , "unit_amt"] = agg_total$item_amt / agg_total$cnt
  agg_total[ order(agg_total$gender, -agg_total$unit_amt), ]
  
  ## (answer) 여자 2번째: 화장품, 남자 2번째: 의류 
  
  arrange(agg_total, gender, unit_amt);
  arrange(agg_total, desc(gender), unit_amt);
  arrange(agg_total, gender, desc(unit_amt));
  arrange(agg_total, desc(gender), desc(unit_amt));
  
  
 
  
  
  
  
  
  #### 2 #####
  # base_table
  # 상위 20% 회원이 일으킨 매출은 전체 매출의 몇 퍼센트를 차지하며
  # 상위 20% 회원이 일으킨 매출은
  # 상위 20% 회원이 일으킨 매출
  # 상위 20%
  rank(c(10,11,11,11,12,13,14,14))
  rank(c(10,11,11,11,12,13,14,14), ties.method="min")
  rev(rank(c(10,11,11,11,12,13,14,14), ties.method="min"))
  rank(-c(10,11,11,11,12,13,14,14), ties.method="min")
  
  
  cust = aggregate(data = base_table, 
                   item_amt ~ cust_no,
                   FUN = "sum")
  head(cust, 10)
  
  cust[, "rank"] = rank(-cust$item_amt, ties.method="min")
  
  cust_upper = cust[cust$rank <= nrow(cust)*0.2, ]
  head(cust_upper, 10)
  
  cust_lower = cust[cust$rank >= nrow(cust)*0.8, ]
  head(cust_lower, 10)
  
  ## 상위 20% 매출 비중 
  round(sum(cust_upper$item_amt)  / sum(cust$item_amt)* 100, 3) 
  ## 하위 20% 매출 비중 
  round(sum(cust_lower$item_amt)  / sum(cust$item_amt)*100, 3)
  ## 상위가 하위의 몇배 ?
  round(sum(cust_upper$item_amt)/ sum(cust_lower$item_amt)*100, 3)
  
  ## 3 .base_table
  head(base_table)
  
  base_table[ , "age_cls"] = ifelse(test = base_table$age == 30, "G1",
                                    ifelse(test = base_table$age == 40, "G2", "G3"))
  
  table(base_table[, c("age", "age_cls")])
   
  
  head(cust)
  cust_agg = aggregate(data = base_table, 
                       item_amt ~ age_cls + cust_no ,
                       FUN = "sum")
  head(cust_agg)
  
  model = aov(data = cust_agg, formula = item_amt ~ age_cls)
  summary(model)
  
  library("agricolae")
  duncan.test(model, trt = "age_cls")
  duncan.test(model, trt = "age_cls", console = TRUE)
  #### G2>G3=G1
  
  
  
  
  
  #######################################
  
  df = read.csv("titanic_train.csv", stringsAsFactors = FALSE)
  head(df)
  
  # Q1.  각 변수의 결측치 개수를 확인하시오
  # Pclass 또는 Fare 변수에 결측치가 있는 경우 결측치를 포함한 
  # row를 제거하시오.
  ?sapply
  class(sapply(df, FUN = function(x){sum(is.na(x))}))
  class(lapply(df, FUN = function(x){sum(is.na(x))}))
  
  apply(df, MARGIN=2, FUN = function(x){sum(is.na(x))})
  
  df_sub = df[is.na(df$Age) == FALSE, ]
  
  df[is.na(df$Age), "Age"] = mean(df$Age, na.rm = TRUE)
  
  ?mean
  
  sum(is.na(df$PassengerId))  
  sum(is.na(df$Survived))
  sum(is.na(df$Pclass))
  sum(is.na(df$Name))
  sum(is.na(df$Sex))
  sum(is.na(df$Age))
  
  colnames(df)[1]
  ?print
  
  for(n in 1:ncol(df)) {
    print( colnames(df)[n]  sum(is.na(df[, n])) )
  }
  
      
  # Q2. Pclass 변수에 따른 Fare 변수의 차이가 있는지 분산분석을 실시하시오, 
  # 그 결과를 토대로 duncan의 사후검정을 실시하시오
  
  model = aov(data = df, formula = Fare ~ Pclass)
  summary(model)
  
  library("agricolae")
  duncan.test(model, trt = "Pclass", console = TRUE)
  
  
   
  
  
  ##### 4. 연관규칙 분석 
  df_join = base_table
  
  install.packages("arules")
  library("arules")
  
  head(df_join)
  
  df_bsk = as(split(df_join[, "item_ctg2"], f = df_join[ , "cust_no"]), "transactions")
  ##S4
  df_bsk@data@
    
    inspect(df_bsk[1:5])
  
  df_bsk_sub = df_bsk[size(df_bsk) > 1]
  table(size(df_bsk_sub))
  
  df_rls = apriori(data = df_bsk_sub, 
                   parameter = list(supp = 0.001,
                                    conf = 0.001))
  
  df_rls = sort(df_rls, by = "confidence", decreasing = TRUE)
  head(df_rls)
  
  df_rls_1 = subset(df_rls, subset = lhs %in% "농산물")
  df_rls_1 = sort(df_rls_1, by = "lift", decreasing = TRUE)
  inspect(df_rls_1[1:3])
  
  # 가공식품
  ## 고급도움말 
  vignette("arules")
  
  
