--A★スペキュレーション
--Lua by Gim J.Blocks
function c100213002.initial_effect(c)
	c:SetSPSummonOnce(100213002)
	--fusion material
	c:EnableReviveLimit()
	aux.AddFusionProcFun2(c,c100213002.ffilter1,c100213002.ffilter2,true)
	--atkup
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetProperty(EFFECT_FLAG_SINGLE_RANGE)
	e1:SetRange(LOCATION_MZONE)
	e1:SetCode(EFFECT_UPDATE_ATTACK)
	e1:SetCondition(c100213002.atkcon)
	e1:SetValue(c100213002.val)
	c:RegisterEffect(e1)
	--indes
	local e2=Effect.CreateEffect(c)
	e2:SetType(EFFECT_TYPE_SINGLE)
	e2:SetProperty(EFFECT_FLAG_SINGLE_RANGE)
	e2:SetRange(LOCATION_MZONE)
	e2:SetCode(EFFECT_INDESTRUCTABLE_BATTLE)
	e2:SetCondition(c100213002.indcon)
	e2:SetValue(1)
	c:RegisterEffect(e2)
	local e3=e2:Clone()
	e3:SetCode(EFFECT_INDESTRUCTABLE_EFFECT)
	c:RegisterEffect(e3)
	--spsummon
	local e4=Effect.CreateEffect(c)
	e4:SetCategory(CATEGORY_SPECIAL_SUMMON)
	e4:SetType(EFFECT_TYPE_IGNITION)
	e4:SetRange(LOCATION_GRAVE)
	e4:SetCost(c100213002.spcost)
	e4:SetTarget(c100213002.sptg)
	e4:SetOperation(c100213002.spop)
	c:RegisterEffect(e4)
end
function c100213002.ffilter1(c)
	return c:IsAttackAbove(2500)
end
function c100213002.ffilter2(c)
	return c:IsDefenseBelow(2500) and c:IsFacedown() and c:IsDefensePos() and c:IsLocation(LOCATION_MZONE)
end
function c100213002.atkcon(e,tp,eg,ep,ev,re,r,rp)
	return e:GetHandler():IsAttackPos()
end
function c100213002.val(e,c)
	local g=Duel.GetMatchingGroup(Card.IsFaceup,e:GetOwnerPlayer(),0,LOCATION_MZONE,nil)
	if g:GetCount()==0 then
		return 0
	else
		local tg,val=g:GetMaxGroup(Card.GetBaseAttack)
		return val
	end
end
function c100213002.indcon(e,tp,eg,ep,ev,re,r,rp)
	return e:GetHandler():IsDefensePos()
end
function c100213002.costfilter(c)
	return c:IsReleasable() and ((c:IsFacedown() and c:IsDefensePos()) or (c:IsFaceup() and c:IsAttackPos()))
end
function c100213002.spcost(e,tp,eg,ep,ev,re,r,rp,chk)
	local g=Duel.GetMatchingGroup(c100213002.costfilter,tp,LOCATION_MZONE,0,nil)
	if chk==0 then return g:CheckSubGroup(aux.gfcheck,2,2,Card.IsPosition,POS_FACEUP_ATTACK,POS_FACEDOWN_DEFENSE) end
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_RELEASE)
	local sg=g:SelectSubGroup(tp,aux.gfcheck,false,2,2,Card.IsPosition,POS_FACEUP_ATTACK,POS_FACEDOWN_DEFENSE)
	Duel.Release(sg,REASON_COST)
end
function c100213002.sptg(e,tp,eg,ep,ev,re,r,rp,chk)
	local c=e:GetHandler()
	if chk==0 then return Duel.GetLocationCount(tp,LOCATION_MZONE)>0 and c:IsCanBeSpecialSummoned(e,0,tp,false,false) end
	Duel.SetOperationInfo(0,CATEGORY_SPECIAL_SUMMON,c,1,0,0)
end
function c100213002.spop(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	if c:IsRelateToEffect(e) then
		Duel.SpecialSummon(c,0,tp,tp,false,false,POS_FACEUP)
	end
end