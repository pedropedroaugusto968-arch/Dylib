# Nome do seu Projeto
TWEAK_NAME = NexusVIP

# Arquivos que serão compilados
NexusVIP_FILES = Tweak.xm
NexusVIP_CFLAGS = -fobjc-arc

# Arquiteturas do iPhone (64 bits)
ARCHS = arm64 arm64e

include $(THEOS)/makefiles/common.mk
include $(THEOS_MAKE_PATH)/tweak.mk
