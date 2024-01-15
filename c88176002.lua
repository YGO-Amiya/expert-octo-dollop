--超限机装少女 博丽灵梦
function c88176002.initial_effect(c)
	c:EnableReviveLimit()
	aux.AddFusionProcCodeFun(c,88176001,c88176002.ffilter,2,true,true)
	aux.AddContactFusionProcedure(c,c88176002.cfilter,LOCATION_ONFIELD,0,aux.tdcfop(c)):SetValue(SUMMON_VALUE_SELF)
	local e1=Effect.CreateEffect(c)
	e1:SetDescription(aux.Stringid(88176002,0))
	e1:SetCategory(CATEGORY_SPECIAL_SUMMON)
	e1:SetType(EFFECT_TYPE_IGNITION)
	e1:SetProperty(EFFECT_FLAG_CARD_TARGET)
	e1:SetRange(LOCATION_EXTRA)
	e1:SetCountLimit(1,88176002)
	e1:SetTarget(c88176002.settg)
	e1:SetOperation(c88176002.setop)
	c:RegisterEffect(e1)
	local e2=Effect.CreateEffect(c)
	e2:SetDescription(aux.Stringid(88176002,1))
	e2:SetType(EFFECT_TYPE_SINGLE+EFFECT_TYPE_TRIGGER_O)
	e2:SetProperty(EFFECT_FLAG_DELAY)
	e2:SetCode(EVENT_SPSUMMON_SUCCESS)
	e2:SetCondition(c88176002.condition1)
	e2:SetOperation(c88176002.operation1)
	c:RegisterEffect(e2)
	local e3=Effect.CreateEffect(c)
	e3:SetDescription(aux.Stringid(88176002,3))
	e3:SetCategory(CATEGORY_POSITION)
	e3:SetType(EFFECT_TYPE_SINGLE+EFFECT_TYPE_TRIGGER_O)
	e3:SetCode(EVENT_ATTACK_ANNOUNCE)
	e3:SetCost(c88176002.tgcost)
	e3:SetTarget(c88176002.tgtg)
	e3:SetOperation(c88176002.tgop)
	c:RegisterEffect(e3)
end
function c88176002.cfilter(c)
	return (c:IsFusionCode(88176001) or c:IsType(TYPE_MONSTER))
		and c:IsAbleToDeckOrExtraAsCost()
end
function c88176002.ffilter(c,fc,sub,mg,sg)
	return not sg or not sg:IsExists(Card.IsFusionCode,1,c,c:GetFusionCode())
end
function c88176002.setfilter(c)
	return c:IsSetCard(0x3592) and c:GetType()==TYPE_SPELL 
end
function c88176002.settg(e,tp,eg,ep,ev,re,r,rp,chk,chkc)
	local c=e:GetHandler()
	if chkc then return chkc:IsLocation(LOCATION_GRAVE) and chkc:IsControler(tp) and c88176002.setfilter(chkc) end
	if chk==0 then return Duel.IsExistingTarget(c88176002.setfilter,tp,LOCATION_GRAVE,0,1,nil) end
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_SPSUMMON)
	local g=Duel.SelectTarget(tp,c88176002.setfilter,tp,LOCATION_GRAVE,0,1,1,nil)
end
function c88176002.setop(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	local tc=Duel.GetFirstTarget()
	if tc:IsRelateToEffect(e) then
		local e1=Effect.CreateEffect(c)
		e1:SetType(EFFECT_TYPE_FIELD)
		e1:SetCode(EFFECT_ADD_SETCODE)
		if tc:IsCode(88178003) then
			e1:SetValue(0x3591,0x3597)
		elseif tc:IsCode(88178102) then
			e1:SetValue(0x3593,0x594)
		elseif tc:IsCode(88178309) then
			e1:SetValue(0x595,0x596)
		elseif tc:IsCode(88178601) then
			e1:SetValue(0x3598,3599)
		elseif tc:IsCode(88178801) then
			e1:SetValue(0x359a)
		elseif tc:IsCode(88178901) then
			e1:SetValue(0x359b)
		elseif tc:IsCode(88179001) then
			e1:SetValue(0x359c)
		elseif tc:IsCode(88179101) then
			e1:SetValue(0x359d)
		elseif tc:IsCode(88179201) then
			e1:SetValue(0x359e,0x559e)
		elseif tc:IsCode(88179301) then
			e1:SetValue(0x359f,0x559f)
		elseif tc:IsCode(88179401) then
			e1:SetValue(0x35a0)
		elseif tc:IsCode(88179501) then
			e1:SetValue(0x35a1)
		elseif tc:IsCode(88179601) then
			e1:SetValue(0x35a2,0x55a2,0x65a2,0x95a2)
		elseif tc:IsCode(88179701) then
			e1:SetValue(0x35a3,0x55a3)
		end
		e1:SetTargetRange(LOCATION_DECK+LOCATION_HAND+LOCATION_ONFIELD+LOCATION_GRAVE+LOCATION_REMOVED+LOCATION_EXTRA,0)
		e1:SetTarget(c88176001.codefilter)
		Duel.RegisterEffect(e1,tp)
		local e2=Effect.CreateEffect(c)
		e2:SetType(EFFECT_TYPE_FIELD)
		e2:SetCode(EFFECT_ADD_SETCODE)
		if tc:IsCode(88178003) then
			e2:SetValue(0x3597)
		elseif tc:IsCode(88178102) then
			e2:SetValue(0x594)
		elseif tc:IsCode(88178309) then
			e2:SetValue(0x596)
		elseif tc:IsCode(88178601) then
			e2:SetValue(0x3599)
		elseif tc:IsCode(88179201) then
			e2:SetValue(0x559e)
		elseif tc:IsCode(88179301) then
			e2:SetValue(0x559f)
		elseif tc:IsCode(88179601) then
			e2:SetValue(0x55a2)
		elseif tc:IsCode(88179701) then
			e2:SetValue(0x55a3)
		end
		e2:SetTargetRange(LOCATION_DECK+LOCATION_HAND+LOCATION_ONFIELD+LOCATION_GRAVE+LOCATION_REMOVED+LOCATION_EXTRA,0)
		e2:SetTarget(c88176002.codefilter)
		Duel.RegisterEffect(e2,tp)
		local e3=Effect.CreateEffect(c)
		e3:SetType(EFFECT_TYPE_FIELD)
		e3:SetCode(EFFECT_ADD_SETCODE)
		if tc:IsCode(88179601) then
			e3:SetValue(0x65a2)
		end
		e3:SetTargetRange(LOCATION_DECK+LOCATION_HAND+LOCATION_ONFIELD+LOCATION_GRAVE+LOCATION_REMOVED+LOCATION_EXTRA,0)
		e3:SetTarget(c88176002.codefilter)
		Duel.RegisterEffect(e3,tp)
		local e4=Effect.CreateEffect(c)
		e4:SetType(EFFECT_TYPE_FIELD)
		e4:SetCode(EFFECT_ADD_SETCODE)
		if tc:IsCode(88179601) then
			e4:SetValue(0x95a2)
		end
		e4:SetTargetRange(LOCATION_DECK+LOCATION_HAND+LOCATION_ONFIELD+LOCATION_GRAVE+LOCATION_REMOVED+LOCATION_EXTRA,0)
		e4:SetTarget(c88176002.codefilter)
		Duel.RegisterEffect(e4,tp)
		local e5=Effect.CreateEffect(c)
		e5:SetDescription(aux.Stringid(88176002,2))
		e5:SetType(EFFECT_TYPE_SINGLE+EFFECT_TYPE_TRIGGER_O)
		e5:SetProperty(EFFECT_FLAG_DELAY)
		e5:SetCode(EVENT_SPSUMMON_SUCCESS)
		if tc:IsCode(88178003) then
			e5:SetLabel(0x3591,0x3597)
		elseif tc:IsCode(88178102) then
			e5:SetLabel(0x3593,0x594)
		elseif tc:IsCode(88178309) then
			e5:SetLabel(0x595,0x596)
		elseif tc:IsCode(88178601) then
			e5:SetLabel(0x3598,3599)
		elseif tc:IsCode(88178801) then
			e5:SetLabel(0x359a)
		elseif tc:IsCode(88178901) then
			e5:SetLabel(0x359b)
		elseif tc:IsCode(88179001) then
			e5:SetLabel(0x359c)
		elseif tc:IsCode(88179101) then
			e5:SetLabel(0x359d)
		elseif tc:IsCode(88179201) then
			e5:SetLabel(0x359e,0x559e)
		elseif tc:IsCode(88179301) then
			e5:SetLabel(0x359f,0x559f)
		elseif tc:IsCode(88179401) then
			e5:SetLabel(0x35a0)
		elseif tc:IsCode(88179501) then
			e5:SetLabel(0x35a1)
		elseif tc:IsCode(88179601) then
			e5:SetLabel(0x35a2,0x55a2,0x65a2,0x95a2)
		elseif tc:IsCode(88179701) then
			e5:SetLabel(0x35a3,0x55a3)
		end
		e5:SetOperation(c88176002.operation2)
		local e6=Effect.CreateEffect(c)
		e6:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_GRANT)
		e6:SetTargetRange(LOCATION_DECK+LOCATION_HAND+LOCATION_ONFIELD+LOCATION_GRAVE+LOCATION_REMOVED+LOCATION_EXTRA,0)
		e6:SetTarget(aux.TargetBoolFunction(Card.IsCode,88176002))
		e6:SetLabelObject(e5)
		e6:SetReset(RESET_PHASE+PHASE_END)
		Duel.RegisterEffect(e6,tp) 
		Duel.RegisterFlagEffect(e:GetHandlerPlayer(),88176002,RESET_PHASE+PHASE_END,EFFECT_FLAG_OATH,1)
	end
end
function c88176002.codefilter(e,c)
	return c:IsCode(88176002)
end
function c88176002.condition1(e,tp,eg,ep,ev,re,r,rp)
	return Duel.GetFlagEffect(e:GetHandlerPlayer(),88176002)==0
end
function c88176002.operation1(e,tp,eg,ep,ev,re,r,rp)
	local e1=Effect.CreateEffect(e:GetHandler())
	e1:SetType(EFFECT_TYPE_FIELD)
	e1:SetProperty(EFFECT_FLAG_IGNORE_IMMUNE)
	e1:SetCode(EFFECT_CANNOT_BE_EFFECT_TARGET)
	e1:SetTargetRange(LOCATION_MZONE,0)
	e1:SetTarget(c88176002.efftg1)
	e1:SetValue(aux.tgoval)
	e1:SetReset(RESET_PHASE+PHASE_END)
	Duel.RegisterEffect(e1,tp)
	local e2=e1:Clone()
	e2:SetCode(EFFECT_INDESTRUCTABLE_EFFECT)
	e2:SetValue(aux.indoval)
	Duel.RegisterEffect(e2,tp)
end
function c88176002.efftg1(e,c)
	return c:IsSetCard(0x9592)
end
function c88176002.operation2(e,tp,eg,ep,ev,re,r,rp)
	local e1=Effect.CreateEffect(e:GetHandler())
	e1:SetType(EFFECT_TYPE_FIELD)
	e1:SetProperty(EFFECT_FLAG_IGNORE_IMMUNE)
	e1:SetCode(EFFECT_CANNOT_BE_EFFECT_TARGET)
	e1:SetTargetRange(LOCATION_MZONE,0)
	e1:SetTarget(c88176002.efftg2)
	e1:SetLabel(e:GetLabel())
	e1:SetValue(aux.tgoval)
	e1:SetReset(RESET_PHASE+PHASE_END)
	Duel.RegisterEffect(e1,tp)
	local e2=e1:Clone()
	e2:SetCode(EFFECT_INDESTRUCTABLE_EFFECT)
	e2:SetValue(aux.indoval)
	Duel.RegisterEffect(e2,tp)
end
function c88176002.efftg2(e,c)
	return c:IsSetCard(0x9592,e:GetLabel())
end
function c88176002.tgcost(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then
		e:SetLabel(100)
		return Duel.CheckLPCost(tp,1000) and Duel.IsExistingMatchingCard(Card.IsDiscardable,tp,LOCATION_HAND,0,1,nil)
	end
	Duel.PayLPCost(tp,1000)
	Duel.DiscardHand(tp,Card.IsDiscardable,1,1,REASON_COST+REASON_DISCARD)
	if Duel.CheckLPCost(tp,9000) and Duel.IsExistingMatchingCard(Card.IsDiscardable,tp,LOCATION_HAND,0,3,nil) and Duel.SelectYesNo(tp,aux.Stringid(88176002,4)) then
		Duel.PayLPCost(tp,9000)
		Duel.DiscardHand(tp,Card.IsDiscardable,3,3,REASON_COST+REASON_DISCARD)
		e:SetLabel(200)
	end
end
function c88176002.tgtg(e,tp,eg,ep,ev,re,r,rp,chk)
	local g=Duel.GetMatchingGroup(Card.IsAbleToGrave,tp,0,LOCATION_ONFIELD,nil)
	if chk==0 then
		if e:GetLabel()~=100 then return g:GetCount()>0 end
		e:SetLabel(0)
		return true
	end
	Duel.SetOperationInfo(0,CATEGORY_TOGRAVE,g,g:GetCount(),0,0)
	if e:GetLabel()==200 then
		Duel.SetChainLimit(c88176002.chainlm)
	end
end
function c88176002.chainlm(e,ep,tp)
	return tp==ep
end
function c88176002.tgop(e,tp,eg,ep,ev,re,r,rp)
	local g=Duel.GetMatchingGroup(Card.IsAbleToGrave,tp,0,LOCATION_ONFIELD,nil)
	if g:GetCount()>0 then
		Duel.SendtoGrave(g,REASON_EFFECT)
	end
end