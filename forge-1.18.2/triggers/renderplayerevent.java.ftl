<#include "procedures.java.ftl">
@Mod.EventBusSubscriber
public class ${name}Procedure {
    @OnlyIn(Dist.CLIENT)
    @SubscribeEvent
    public static void onEventTriggered(RenderPlayerEvent.Pre event) {
        <#assign dependenciesCode><#compress>
            <@procedureDependenciesCode dependencies, {
            "x": "(Player) event.getEntity().getX()",
            "y": "(Player) event.getEntity().getY()",
            "z": "(Player) event.getEntity().getZ()",
            "entity": "(Player) event.getEntity()",
            "world": "(Player) event.getEntity().level()",
            "Arms": "(HumanoidModel) event.getRenderer().getModel()",
            "event": "event"
            }/>
        </#compress></#assign>
        execute(event<#if dependenciesCode?has_content>,</#if>${dependenciesCode});
    }