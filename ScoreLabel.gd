extends RichTextLabel

var score_string = "0"
var score_num = 0

func update_score(score_change):
	score_num += score_change
	score_string = score_num.to_string()
