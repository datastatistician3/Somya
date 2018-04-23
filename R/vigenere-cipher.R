# performStrip <- function(mssg) {
# 	strStripped
#   for (variable in vector) {
#     
#   }
# 	for (int x in x < mssg.length(); x++) {
# 		if (mssg[x] >= 'A' && mssg[x] <= 'Z')
# 			strStripped += mssg[x] + 'a' - 'A'
# 		else if (mssg[x] >= 'a' && mssg[x] <= 'z')
# 			strStripped += mssg[x]
# 	}
# 	return(strStripped)
# }
# 
# encryptVig(keyword, plain) {
# 
# 	cipherText
# 	for (int x = 0; x < plain.length(); x++) {
# 		cipherText.push_back((((plain[x] - 'a') + (keyword[x % keyword.length()] - 'a')) % 26) + 'a')
# 	}
# 	return(cipherText)
# }
# 
# decryptVig(kword, cipherText) {
# 	textPlain
# 	int num
# 	for (int x = 0; x < cipherText.length(); x++) {
# 		num = (cipherText.at(x) - 'a') - (kword[x % kword.length()] - 'a')
# 		if (num >= 0)
# 			textPlain.push_back(num % 26 + 'a')
# 		else
# 			textPlain.push_back(26 + num + 'a')
# 	}
# 	return(textPlain)
# }