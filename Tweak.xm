#import <UIKit/UIKit.h>
#import <substrate.h>

// NEXUS VIP - BY @eoo_gomes3
// Função para forçar o acerto no Bone 8 (Cabeça) quando o jogo detectar o Bone 5 (Pescoço)

void (*old_GetHitbox)(void* instance);
void my_GetHitbox(void* instance) {
    if (instance != NULL) {
        // O Offset 0x48 é o padrão para identificar a parte do corpo atingida
        int *boneID = (int*)((uintptr_t)instance + 0x48); 
        
        if (*boneID == 5) { // Se atingir o pescoço
            *boneID = 8;    // O script altera para ser Headshot (8)
        }
    }
    return old_GetHitbox(instance);
}

// O Constructor garante que o hack injete assim que o jogo abrir (Auto-Inject)
__attribute__((constructor))
static void initialize() {
    // IMPORTANTE: Este offset 0x1234567 deve ser trocado pelo atual da Garena
    unsigned long hs_offset = 0x1234567; 
    
    MSHookFunction((void*)(hs_offset), (void*)my_GetHitbox, (void**)&old_GetHitbox);
    
    NSLog(@"[NEXUS STORE] AUTO-INJECT HS ATIVADO COM SUCESSO!");
}

 
