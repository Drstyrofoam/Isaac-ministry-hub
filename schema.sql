-- Run this entire script in Supabase SQL Editor
-- Go to: Supabase Dashboard → SQL Editor → New Query → paste → Run

-- ── PRAYERS (people) ──────────────────────────────────────────────────────────
create table if not exists prayers (
  id uuid default gen_random_uuid() primary key,
  name text not null,
  tier text not null,
  focus text,
  notes text,
  last_prayed date,
  created_at timestamptz default now()
);

-- ── PRAYER POINTS ─────────────────────────────────────────────────────────────
create table if not exists prayer_points (
  id uuid default gen_random_uuid() primary key,
  title text not null,
  body text,
  type text not null default 'general', -- 'general' | 'current'
  person text,
  archived boolean default false,
  archived_at date,
  created_at timestamptz default now()
);

-- ── DEADLINES ─────────────────────────────────────────────────────────────────
create table if not exists deadlines (
  id uuid default gen_random_uuid() primary key,
  name text not null,
  date date not null,
  type text not null default 'other',
  created_at timestamptz default now()
);

-- ── STUDY CHECKLIST ───────────────────────────────────────────────────────────
create table if not exists study (
  id uuid default gen_random_uuid() primary key,
  key text unique not null,
  checked boolean default false,
  updated_at timestamptz default now()
);

-- ── ROW LEVEL SECURITY (open for now — single user app) ──────────────────────
alter table prayers enable row level security;
alter table prayer_points enable row level security;
alter table deadlines enable row level security;
alter table study enable row level security;

create policy "Allow all" on prayers for all using (true) with check (true);
create policy "Allow all" on prayer_points for all using (true) with check (true);
create policy "Allow all" on deadlines for all using (true) with check (true);
create policy "Allow all" on study for all using (true) with check (true);

-- ── SEED PRAYER POINTS FROM PHONE NOTES ──────────────────────────────────────
insert into prayer_points (title, body, type, person) values
('Salvation & faith', 'Non-Christian friend group — pray they''d become Christians', 'general', 'Sergot, James, Michael, Cyrus, Neeraj'),
('Freedom from bad habits', 'Specifically fleshly desires — pray for genuine freedom to pursue Christ', 'general', ''),
('Annabelle at UTS', 'Pray for her faith and walk at uni', 'general', 'Annabelle'),
('Lulu at uni', 'Pray for Lulu''s faith and university life', 'general', 'Lulu'),
('Jaedon''s bad habits', 'Hali''s work cooked by the pokies — pray for Jaedon to break out', 'current', 'Jaedon'),
('Hindu philosophy', 'Ramen mate convinced by Hinduism — pray for gospel openness', 'current', 'Hindu friend'),
('Brodie + Thomas leaving youth', 'Both leaving youth next year — pray for ongoing faith', 'current', 'Brodie + Thomas'),
('Peff — spiritual boldness', 'Pray for boldness in faith, prep for kids ministry, serving thankfully', 'general', 'Peff'),
('Peff — knee fracture', 'Another fracture found in knee — pray for healing and faith through it', 'current', 'Peff'),
('Peff — mate''s girlfriend', 'Mate gone from abuser to teacher, girlfriend helping him uncover faith — pray for genuine conversion', 'current', 'Peff''s mate'),
('Dom — church + youth growth', 'Big prayer: that his church/youth grows in numbers and consistency', 'general', 'Dom'),
('Dom — kids ministry discipline', 'Pray for discipline with the ''cat'' girl and showing Jesus''s love acutely', 'current', 'Dom'),
('Dom — employment', 'Had first work shift — tiring but getting money. Pray for provision', 'current', 'Dom'),
('Lust', 'Pray for Peff — lust as an ongoing battle', 'general', 'Peff'),
('Dylan at Senior High', 'Get Dylan interested — someone to get around him', 'current', 'Dylan'),
('Warbs — validation vs. service', 'Does he feel like he has to be strong? Pray he finds identity in Christ not performance', 'general', 'Warbs'),
('Axel — mental health & spiritual warfare', 'Pray he''d fight those demons with truth — mental health and spiritual battle', 'current', 'Axel'),
('Tom J', 'Not succumbing to lies of the devil + finances + taking notes each week + walk-up evangelism', 'general', 'Tom J'),
('Chris A — night church love growing', 'Love for night church growing generally — pray for joy and depth', 'general', 'Chris A'),
('Chris — depression & contentment', 'Pray for him to get over depressive episodes, to be content, to find rest in God', 'current', 'Chris'),
('Philip Yun', 'Body image + anorexia + living full for Jesus + changing friend group + better choices', 'general', 'Philip Yun'),
('Naomi — 5 min prayer for non-Christians', 'Praying for Isla and Olivia — wants them to go to her school', 'current', 'Naomi'),
('Ben Ali', 'Pray that Ben Ali will keep praying', 'current', 'Ben Ali'),
('Rex''s brother Caleb', 'Getting engaged on Dec 13th — pray over that season', 'current', 'Caleb (Rex''s brother)'),
('Noah — confessing sin', 'Continue to check in with Noah on the matter of confessing sin, even as a community', 'current', 'Noah'),
('David — trust issues + faith', 'Still has trust issues and difficulty forgiving. Doesn''t yet have a personal relationship with God. Pray for genuine conversion and healing', 'general', 'David'),
('Harry', 'Pray for Harry (carry in prayer)', 'general', 'Harry'),
('Natalie', 'Pray for Natalie + how to walk alongside her well', 'general', 'Natalie'),
('Andrew Ho — new at SCIVET', 'Not a Christian — pray for gospel openness', 'current', 'Andrew Ho'),
('Terrence and Lin', 'Talked to them about Jesus — pray for follow-through and openness', 'current', 'Terrence + Lin'),
('Oliver', 'Not stress too much — see God''s perspective, not be stoic', 'general', 'Oliver'),
('EJ — fitting in', 'Pray he''d be able to fit in with his people and find belonging in Christ', 'current', 'EJ'),
('Christian''s gymnastics friend Ned', 'Pray for Ned''s openness to faith', 'current', 'Ned'),
('Levi — St Matt''s community', 'Pray St Matt''s can be a safe place without cliques', 'general', 'Levi'),
('Abbey — time management', 'Time management for tasks so as not to lose first focus on God', 'current', 'Abbey'),
('Lucas (Ethan''s friend)', 'Looking to consolidate his atheism — but reading Gospel of John with Ethan. Pray for gospel breakthrough', 'current', 'Lucas'),
('Nathan at Royal Flying Doctor', 'Pray for Nathan in this role', 'current', 'Nathan'),
('Archie Dykes', 'Motivation for reading Bible and praying consistently', 'general', 'Archie Dykes'),
('Kiraley', 'Intentionally catching up with people in the faculty + balancing time + not letting rest with God slip', 'general', 'Kiraley'),
('Finn', 'Would not idolise relationships but have spiritual ones and sacrifice to love others with Christ first', 'general', 'Finn'),
('Peff — just being a young adult', 'Pray he''d do well at just being a young adult for a month without overloading', 'current', 'Peff'),
('Kye at Eden', 'Pray for Kye', 'current', 'Kye'),
('Derek''s grandparents', 'Pray for Derek''s grandparents', 'current', 'Derek'),
('Nayereh Arjaneh — prisoner in Iran', 'Imprisoned for her faith in Iran — pray for safety, faith, and release', 'current', 'Nayereh Arjaneh'),
('Michael and Rani in Belgium', 'Character would allow God to work through them — extended term to December', 'current', 'Michael + Rani'),
('Flynn (youth from St Luke''s)', 'Pray he''d be able to come back', 'current', 'Flynn'),
('Zali', 'Pray for Zali in a world of body image difficulties', 'general', 'Zali'),
('Josh', 'Staying rooted in humility + dealing with disingenuousness', 'general', 'Josh'),
('Josh''s brother Jordan', 'Hasn''t been going to church — pray for return', 'current', 'Jordan (Josh''s brother)'),
('Ocean', 'Pray for Ocean (carry in prayer)', 'general', 'Ocean'),
('Matt — devotional & faith disciplines', 'Reading Everyday with Jesus — 10 min on transport, prayer, meditate, application. Pray for consistency', 'general', 'Matt'),
('Rachel''s youth friends', 'Mia, Zoe, Sophia — wants to invite them. Pray for openness', 'current', 'Rachel (youth)'),
('Cyrus — reading the Bible', 'Reading with a mate on Mondays at 10am — pray for fruitful discipleship', 'general', 'Cyrus'),
('Eadia', 'Pray for Eadia', 'general', 'Eadia'),
('Evangelism at FFAC — community outreach', 'Nick and Maitland evangelical looking to grow through SRE etc — pray for fruitful partnerships', 'general', ''),
('Prayer groups bearing fruit', 'Big Fridays were excellent — pray for continued intentionality and gospel focus', 'general', ''),
('Isaac — identity in Christ not performance', 'Pray to work on the issue of control. Trust God with each decision. Not fall into mere habit', 'general', 'Isaac'),
('Isaac — love people automatically', 'Cynicism stopping automatic love — pray to kill that and love freely from Christ', 'general', 'Isaac'),
('Isaac — killing pride', 'Kill pride, arrogance — acknowledge Christ drinking the cup of wrath. See how Jesus took my sin', 'general', 'Isaac'),
('Kids church prayer', '30 mins pray for kids church — pray for fruit and faith in the children', 'general', ''),
('Prayer meeting semi-regularly', 'Helpful break in routine — pray this happens consistently', 'current', ''),
('Don Carson''s prayer', '"I pray that I would go through sufficient suffering to be brought to love Christ" — carry this as a personal prayer', 'general', 'Isaac');
