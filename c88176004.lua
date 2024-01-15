--超限机装少女 爱丽丝
function c88176004.initial_effect(c)
	--synchro summon
	aux.AddSynchroMixProcedure(c,aux.Tuner(nil),aux.Tuner(nil),nil,aux.FilterBoolFunction(Card.IsCode,88176003),1,1)
	c:EnableReviveLimit()
	local e0=Effect.CreateEffect(c)
	e0:SetType(EFFECT_TYPE_SINGLE)
	e0:SetProperty(EFFECT_FLAG_SINGLE_RANGE+EFFECT_FLAG_CANNOT_DISABLE+EFFECT_FLAG_UNCOPYABLE)
	e0:SetCode(EFFECT_SPSUMMON_CONDITION)
	e0:SetRange(LOCATION_EXTRA)
	e0:SetValue(c88176004.splimit)
	c:RegisterEffect(e0)
	local e1=Effect.CreateEffect(c)
	e1:SetDescription(aux.Stringid(88176004,0))
	e1:SetCategory(CATEGORY_SPECIAL_SUMMON)
	e1:SetType(EFFECT_TYPE_IGNITION)
	e1:SetProperty(EFFECT_FLAG_CARD_TARGET)
	e1:SetRange(LOCATION_EXTRA)
	e1:SetCountLimit(1,88176004)
	e1:SetTarget(c88176004.settg)
	e1:SetOperation(c88176004.setop)
	c:RegisterEffect(e1)
	local e2=Effect.CreateEffect(c)
	e2:SetDescription(aux.Stringid(88176004,1))
	e2:SetType(EFFECT_TYPE_SINGLE+EFFECT_TYPE_TRIGGER_O)
	e2:SetProperty(EFFECT_FLAG_DELAY)
	e2:SetCode(EVENT_SPSUMMON_SUCCESS)
	e1:SetCountLimit(1,88276004)
	e2:SetCondition(c88176004.condition1)
	e2:SetTarget(c88176004.target1)
	e2:SetOperation(c88176004.operation1)
	c:RegisterEffect(e2)
	local e3=Effect.CreateEffect(c)
	e3:SetDescription(aux.Stringid(88176004,3))
	e3:SetCategory(CATEGORY_SPECIAL_SUMMON)
	e3:SetType(EFFECT_TYPE_SINGLE+EFFECT_TYPE_TRIGGER_O)
	e3:SetProperty(EFFECT_FLAG_CARD_TARGET+EFFECT_FLAG_DELAY)
	e3:SetCode(EVENT_TO_GRAVE)
	e1:SetCountLimit(1,88376004)
	e3:SetCondition(c88176004.spcon1)
	e3:SetTarget(c88176004.sptg1)
	e3:SetOperation(c88176004.spop1)
	c:RegisterEffect(e3)
	local e4=Effect.CreateEffect(c)
	e4:SetType(EFFECT_TYPE_SINGLE)
	e4:SetProperty(EFFECT_FLAG_CANNOT_DISABLE+EFFECT_FLAG_UNCOPYABLE)
	e4:SetCode(21142671)
	c:RegisterEffect(e4)
end
function c88176004.splimit(e,se,sp,st)
	return bit.band(st,SUMMON_TYPE_SYNCHRO)==SUMMON_TYPE_SYNCHRO 
end
function c88176004.cfilter(c)
	return (c:IsFusionCode(88176001) or c:IsType(TYPE_MONSTER))
		and c:IsAbleToDeckOrExtraAsCost()
end
function c88176004.ffilter(c,fc,sub,mg,sg)
	return not sg or not sg:IsExists(Card.IsFusionCode,1,c,c:GetFusionCode())
end
function c88176004.setfilter(c)
	return c:IsSetCard(0x3592) and c:GetType()==TYPE_SPELL 
end
function c88176004.settg(e,tp,eg,ep,ev,re,r,rp,chk,chkc)
	local c=e:GetHandler()
	if chkc then return chkc:IsLocation(LOCATION_GRAVE) and chkc:IsControler(tp) and c88176004.setfilter(chkc) end
	if chk==0 then return Duel.IsExistingTarget(c88176004.setfilter,tp,LOCATION_GRAVE,0,1,nil) end
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_SPSUMMON)
	local g=Duel.SelectTarget(tp,c88176004.setfilter,tp,LOCATION_GRAVE,0,1,1,nil)
end
function c88176004.setop(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	local tc=Duel.GetFirstTarget()
	if tc:IsRelateToEffect(e) then
		local e1=Effect.CreateEffect(c)
		e1:SetType(EFFECT_TYPE_FIELD)
		e1:SetCode(EFFECT_ADD_SETCODE)
		if tc:IsCode(88178003) then
			e1:SetValue(0x3591)
		elseif tc:IsCode(88178102) then
			e1:SetValue(0x3593)
		elseif tc:IsCode(88178309) then
			e1:SetValue(0x595)
		elseif tc:IsCode(88178601) then
			e1:SetValue(0x3598)
		elseif tc:IsCode(88178801) then
			e1:SetValue(0x359a)
		elseif tc:IsCode(88178901) then
			e1:SetValue(0x359b)
		elseif tc:IsCode(88179001) then
			e1:SetValue(0x359c)
		elseif tc:IsCode(88179101) then
			e1:SetValue(0x359d)
		elseif tc:IsCode(88179201) then
			e1:SetValue(0x359e)
		elseif tc:IsCode(88179301) then
			e1:SetValue(0x359f)
		elseif tc:IsCode(88179401) then
			e1:SetValue(0x35a0)
		elseif tc:IsCode(88179501) then
			e1:SetValue(0x35a1)
		elseif tc:IsCode(88179601) then
			e1:SetValue(0x35a2)
		elseif tc:IsCode(88179701) then
			e1:SetValue(0x35a3)
		end
		e1:SetTargetRange(LOCATION_DECK+LOCATION_HAND+LOCATION_ONFIELD+LOCATION_GRAVE+LOCATION_REMOVED+LOCATION_EXTRA,0)
		e1:SetTarget(c88176004.codefilter)
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
		e2:SetTarget(c88176004.codefilter)
		Duel.RegisterEffect(e2,tp)
		local e3=Effect.CreateEffect(c)
		e3:SetType(EFFECT_TYPE_FIELD)
		e3:SetCode(EFFECT_ADD_SETCODE)
		if tc:IsCode(88179601) then
			e3:SetValue(0x65a2)
		end
		e3:SetTargetRange(LOCATION_DECK+LOCATION_HAND+LOCATION_ONFIELD+LOCATION_GRAVE+LOCATION_REMOVED+LOCATION_EXTRA,0)
		e3:SetTarget(c88176004.codefilter)
		Duel.RegisterEffect(e3,tp)
		local e4=Effect.CreateEffect(c)
		e4:SetType(EFFECT_TYPE_FIELD)
		e4:SetCode(EFFECT_ADD_SETCODE)
		if tc:IsCode(88179601) then
			e4:SetValue(0x95a2)
		end
		e4:SetTargetRange(LOCATION_DECK+LOCATION_HAND+LOCATION_ONFIELD+LOCATION_GRAVE+LOCATION_REMOVED+LOCATION_EXTRA,0)
		e4:SetTarget(c88176004.codefilter)
		Duel.RegisterEffect(e4,tp)
		local e5=Effect.CreateEffect(c)
		e5:SetDescription(aux.Stringid(88176004,2))
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
		e5:SetCountLimit(1,88276004)
		e5:SetTarget(c88176004.target2)
		e5:SetOperation(c88176004.operation2)
		local e6=Effect.CreateEffect(c)
		e6:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_GRANT)
		e6:SetTargetRange(LOCATION_DECK+LOCATION_HAND+LOCATION_ONFIELD+LOCATION_GRAVE+LOCATION_REMOVED+LOCATION_EXTRA,0)
		e6:SetTarget(aux.TargetBoolFunction(Card.IsCode,88176004))
		e6:SetLabelObject(e5)
		e6:SetReset(RESET_PHASE+PHASE_END)
		Duel.RegisterEffect(e6,tp) 
		local e7=Effect.CreateEffect(c)
		e7:SetDescription(aux.Stringid(88176004,4))
		e7:SetCategory(CATEGORY_SPECIAL_SUMMON)
		e7:SetType(EFFECT_TYPE_SINGLE+EFFECT_TYPE_TRIGGER_O)
		e7:SetProperty(EFFECT_FLAG_CARD_TARGET+EFFECT_FLAG_DELAY)
		e7:SetCode(EVENT_TO_GRAVE)
		if tc:IsCode(88178003) then
			e7:SetLabel(0x3591,0x3597)
		elseif tc:IsCode(88178102) then
			e7:SetLabel(0x3593,0x594)
		elseif tc:IsCode(88178309) then
			e7:SetLabel(0x595,0x596)
		elseif tc:IsCode(88178601) then
			e7:SetLabel(0x3598,3599)
		elseif tc:IsCode(88178801) then
			e7:SetLabel(0x359a)
		elseif tc:IsCode(88178901) then
			e7:SetLabel(0x359b)
		elseif tc:IsCode(88179001) then
			e7:SetLabel(0x359c)
		elseif tc:IsCode(88179101) then
			e7:SetLabel(0x359d)
		elseif tc:IsCode(88179201) then
			e7:SetLabel(0x359e,0x559e)
		elseif tc:IsCode(88179301) then
			e7:SetLabel(0x359f,0x559f)
		elseif tc:IsCode(88179401) then
			e7:SetLabel(0x35a0)
		elseif tc:IsCode(88179501) then
			e7:SetLabel(0x35a1)
		elseif tc:IsCode(88179601) then
			e7:SetLabel(0x35a2,0x55a2,0x65a2,0x95a2)
		elseif tc:IsCode(88179701) then
			e7:SetLabel(0x35a3,0x55a3)
		end
		e7:SetCountLimit(1,88376004)
		e7:SetCondition(c88176004.spcon2)
		e7:SetTarget(c88176004.sptg2)
		e7:SetOperation(c88176004.spop2)
		c:RegisterEffect(e7)
		local e8=Effect.CreateEffect(c)
		e8:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_GRANT)
		e8:SetTargetRange(LOCATION_DECK+LOCATION_HAND+LOCATION_ONFIELD+LOCATION_GRAVE+LOCATION_REMOVED+LOCATION_EXTRA,0)
		e8:SetTarget(aux.TargetBoolFunction(Card.IsCode,88176004))
		e8:SetLabelObject(e7)
		e8:SetReset(RESET_PHASE+PHASE_END)
		Duel.RegisterEffect(e8,tp) 
		Duel.RegisterFlagEffect(e:GetHandlerPlayer(),88176004,RESET_PHASE+PHASE_END,EFFECT_FLAG_OATH,1)
	end
end
function c88176004.codefilter(e,c)
	return c:IsCode(88176004)
end
function c88176004.condition1(e,tp,eg,ep,ev,re,r,rp)
	return Duel.GetFlagEffect(e:GetHandlerPlayer(),88176004)==0
end
function c88176004.target1(e,tp,eg,ep,ev,re,r,rp,chk)
	local sg=Duel.GetMatchingGroup(Card.IsSetCard,tp,LOCATION_MZONE,0,nil,0x9592)
	if chk==0 then return #sg>0 and Duel.IsExistingMatchingCard(Card.IsAttackBelow,tp,0,LOCATION_MZONE,1,nil,e:GetHandler():GetAttack()) end
	local g=Duel.GetMatchingGroup(Card.IsAttackBelow,tp,0,LOCATION_MZONE,nil,e:GetHandler():GetAttack())
	Duel.SetOperationInfo(0,CATEGORY_DESTROY,g,1,0,0)
end
function c88176004.operation1(e,tp,eg,ep,ev,re,r,rp)
	local sg=Duel.GetMatchingGroup(Card.IsSetCard,tp,LOCATION_MZONE,0,nil,0x9592)
	if #sg>0 then
		Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_DESTROY)
		local dg=Duel.SelectMatchingCard(tp,aux.TRUE,tp,LOCATION_ONFIELD,LOCATION_ONFIELD,1,#sg,nil)
		Duel.HintSelection(dg)
		Duel.Destroy(dg,REASON_EFFECT)
	end
end
function c88176004.target2(e,tp,eg,ep,ev,re,r,rp,chk)
	local sg=Duel.GetMatchingGroup(Card.IsSetCard,tp,LOCATION_MZONE,0,nil,0x9592,e:GetLabel())
	if chk==0 then return #sg>0 and Duel.IsExistingMatchingCard(Card.IsAttackBelow,tp,0,LOCATION_MZONE,1,nil,e:GetHandler():GetAttack()) end
	local g=Duel.GetMatchingGroup(Card.IsAttackBelow,tp,0,LOCATION_MZONE,nil,e:GetHandler():GetAttack())
	Duel.SetOperationInfo(0,CATEGORY_DESTROY,g,1,0,0)
end
function c88176004.operation2(e,tp,eg,ep,ev,re,r,rp)
	local sg=Duel.GetMatchingGroup(Card.IsSetCard,tp,LOCATION_MZONE,0,nil,0x9592,e:GetLabel())
	if #sg>0 then
		Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_DESTROY)
		local dg=Duel.SelectMatchingCard(tp,Card.IsAttackBelow,tp,0,LOCATION_MZONE,1,#sg,nil,e:GetHandler():GetAttack())
		Duel.HintSelection(dg)
		Duel.Destroy(dg,REASON_EFFECT)
	end
end
function c88176004.spcon1(e,tp,eg,ep,ev,re,r,rp)
	return e:GetHandler():IsPreviousLocation(LOCATION_MZONE) and Duel.GetFlagEffect(e:GetHandlerPlayer(),88176004)==0
end
function c88176004.spfilter1(c,e,tp)
	return c:IsSetCard(0x9592) and c:IsCanBeSpecialSummoned(e,0,tp,false,false)
end
function c88176004.sptg1(e,tp,eg,ep,ev,re,r,rp,chk,chkc)
	if chkc then return chkc:IsLocation(LOCATION_GRAVE) and chkc:IsControler(tp) and c88176004.spfilter1(chkc,e,tp) end
	if chk==0 then return Duel.GetLocationCount(tp,LOCATION_MZONE)>0
		and Duel.IsExistingTarget(c88176004.spfilter1,tp,LOCATION_GRAVE,0,1,nil,e,tp) end
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_SPSUMMON)
	local g=Duel.SelectTarget(tp,c88176004.spfilter1,tp,LOCATION_GRAVE,0,1,1,nil,e,tp)
	Duel.SetOperationInfo(0,CATEGORY_SPECIAL_SUMMON,g,1,0,0)
end
function c88176004.spop1(e,tp,eg,ep,ev,re,r,rp)
	local tc=Duel.GetFirstTarget()
	if tc:IsRelateToEffect(e) then
		Duel.SpecialSummon(tc,0,tp,tp,false,false,POS_FACEUP)
	end
end
function c88176004.spcon2(e,tp,eg,ep,ev,re,r,rp)
	return e:GetHandler():IsPreviousLocation(LOCATION_MZONE)
end
function c88176004.spfilter2(c,e,tp)
	return c:IsCanBeSpecialSummoned(e,0,tp,false,false)
end
function c88176004.sptg2(e,tp,eg,ep,ev,re,r,rp,chk,chkc)
	local tg=Duel.GetMatchingGroup(Card.IsSetCard,tp,LOCATION_MZONE,0,nil,0x9592,e:GetLabel())
	local sg=tg:FilterSelect(tp,c88176004.spfilter2,1,1,nil,e,tp)
	if chkc then return chkc:IsLocation(LOCATION_GRAVE) and chkc:IsControler(tp) end
	if chk==0 then return Duel.GetLocationCount(tp,LOCATION_MZONE)>0
		and #sg>0 end
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_SPSUMMON)
	local sg=tg:FilterSelect(tp,c88176004.spfilter2,1,1,nil,e,tp)
	Duel.SetTargetCard(sg)
	Duel.SetOperationInfo(0,CATEGORY_SPECIAL_SUMMON,sg,1,0,0)
end
function c88176004.spop2(e,tp,eg,ep,ev,re,r,rp)
	local tc=Duel.GetFirstTarget()
	if tc:IsRelateToEffect(e) then
		Duel.SpecialSummon(tc,0,tp,tp,false,false,POS_FACEUP)
	end
end