extends RichTextLabel


func _ready() -> void:
	meta_clicked.connect(_richtextlabel_on_meta_clicked)

func _richtextlabel_on_meta_clicked(meta):
	OS.shell_open(str(meta))
