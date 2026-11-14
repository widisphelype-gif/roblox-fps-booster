# Roblox FPS Booster ⚡

Otimizador visual **client-side** em Luau, pensado para experiências próprias no Roblox e para testes em dispositivos móveis.

> **Importante:** este projeto não modifica o aplicativo oficial do Roblox, não altera as configurações globais do Android e não garante aumento de FPS. Um LocalScript só pode otimizar efeitos e propriedades que a experiência permite controlar no cliente.

## Recursos

- Desativa localmente partículas, trilhas, beams e efeitos visuais selecionados.
- Desativa efeitos de pós-processamento e Highlights.
- Desativa sombras de peças quando a propriedade estiver acessível.
- Observa objetos visuais adicionados durante a sessão.
- Inclui botão na tela para ativar/desativar.
- Restaura os valores originais ao desligar o booster.

## Instalação no Roblox Studio

1. Abra uma experiência que você controla no Roblox Studio.
2. No Explorer, abra **StarterPlayer > StarterPlayerScripts**.
3. Crie um **LocalScript** chamado `FPSBooster.client.lua` e cole o conteúdo de `src/FPSBooster.client.lua`.
4. Crie dois **ModuleScripts** no mesmo local:
   - `Config` — conteúdo de `src/Config.lua`.
   - `Optimizer` — conteúdo de `src/Optimizer.lua`.
5. Inicie o teste com **Play**. O botão FPS BOOST aparecerá no canto superior direito.

## Configuração

Edite `Config.lua` para escolher quais efeitos desativar:

| Opção | Função |
| --- | --- |
| `AutoApply` | Ativa o perfil automaticamente |
| `DisableParticles` | Desativa ParticleEmitters |
| `DisableTrailsAndBeams` | Desativa Trails e Beams |
| `DisableFireSmokeAndSparkles` | Desativa Fire, Smoke e Sparkles |
| `DisablePostProcessing` | Desativa efeitos de pós-processamento |
| `DisableHighlights` | Desativa Highlights |
| `DisablePartShadows` | Tenta desativar sombras de BaseParts |
| `OptimizeNewDescendants` | Otimiza efeitos criados durante a partida |

## Limitações

- É um recurso para desenvolvimento e teste em experiências próprias; não é um injetor nem executor de scripts.
- Não consegue forçar 120 FPS, mudar a qualidade global do aplicativo ou desbloquear limites do dispositivo.
- Alterações locais podem ser sobrescritas pelo jogo ou não ser permitidas para certas propriedades.
- Desativar efeitos pode reduzir a clareza visual ou interferir na apresentação pretendida pela experiência.
- O ganho real depende do jogo, do dispositivo e do gargalo de desempenho.

## Estrutura

```text
roblox-fps-booster/
├── src/
│   ├── FPSBooster.client.lua
│   ├── Optimizer.lua
│   └── Config.lua
├── README.md
├── LICENSE
└── CHANGELOG.md
```

## Licença

MIT. Consulte [LICENSE](LICENSE).
