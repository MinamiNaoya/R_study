action_starting_time <- c(70, 48, 130, 75, 84, 74, 40, 103, 42, 55, 62, 60, 46, 70)

duration_of_action <- c(9, 9, 25, 45, 45, 35, 45, 40, 91, 12, 35, 27, 30, 60)
df <- data.frame(action_starting_time = action_starting_time, duration_of_action = duration_of_action)
df

mean_action <- mean(df$action_starting_time)
mean_duration <- mean(df$duration_of_action)
paste0("イソフルラン導入時間の平均: " , as.character(mean_action)) 
paste0("イソフルラン持続時間の平均：" , as.character(mean_duration))

# P = nRT/v 麻酔ガスの分圧
ether_p <- (1*0.71/74 * 0.082 * (273+25))/2
halothane_p <- (0.2*1.87/197.4 * 0.082 * (273+25))/2
isoflurane_p <- (0.3*1.5/184.5 * 0.082 * (273+25))/2

# 溶液中濃度(%)
concentration_ether <- ether_p * 100
concentration_halothane <- halothane_p * 100
concentration_isoflurane <- isoflurane_p * 100


# 血中濃度 血液/ガス分配係数(37℃) *溶液中濃度 * 血液量(mL)
blood_concentration_ether <- 12.0 * ether_p * 100
blood_concentration_halothane <- 2.54 * halothane_p * 100
blood_concentration_isoflurane <- 1.46 * isoflurane_p * 100

paste0("エーテル血中濃度：", as.character(blood_concentration_ether))
paste0("ハロタン血中濃度：", as.character(blood_concentration_halothane))
paste0("イソフルラン血中濃度：", as.character(blood_concentration_isoflurane))

# 0℃の状態では
blood_concentration_ether_0C <- (blood_concentration_ether * 273/(273+37)) / 22400 * 74
blood_concentration_halothane_0c <- (blood_concentration_halothane * 273/(273+37)) / 22400 * 197.4
blood_concentration_isoflurane_0c <- (blood_concentration_isoflurane * 273/(273+37)) / 22400 * 184.5


paste0("溶液中濃度は、エーテル：", as.character(concentration_ether), "%")
paste0("溶液中濃度は、ハロタン：", as.character(concentration_halothane), "%")
paste0("溶液中濃度は、イソフルラン：", as.character(concentration_isoflurane), "%")

paste0("血中濃度は、エーテル", as.character(blood_concentration_ether_0C)," g/100ml")
paste0("血中濃度は、ハロタン", as.character(blood_concentration_halothane_0c), "g/100ml")
paste0("血中濃度は、イソフルラン", as.character(blood_concentration_isoflurane_0c), "g/100ml")






