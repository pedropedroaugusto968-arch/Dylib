#import <UIKit/UIKit.h>
#import <substrate.h>

// Função que modifica a Hitbox (HS Pescoço)
void (*old_GetHitbox)(void* instance);
void my_GetHitbox(void* instance) {
    if (instance != NULL) {
        // Offset que aponta para o ID do osso (Bone ID)
        // O valor 5 é o Pescoço, o valor 8 é a Cabeça
        int *boneID = (int*)((uintptr_t)instance + 0x48); 
        
        if (*boneID == 5) {
            *boneID = 8; // Transforma Pescoço em Headshot automático
        }
    }
    return old_GetHitbox(instance);
}

// O "Constructor" faz o Auto-Inject assim que o jogo abre
__attribute__((constructor))
static void initialize() {
    // Substitua o '0x1234567' pelo Offset real da versão atual do FF
    unsigned long hs_offset = 0x1234567; 
    
    MSHookFunction((void*)(hs_offset), (void*)my_GetHitbox, (void**)&old_GetHitbox);
    
    NSLog(@"[NEXUS STORE] HS PESCOÇO INJETADO COM SUCESSO!");
}
