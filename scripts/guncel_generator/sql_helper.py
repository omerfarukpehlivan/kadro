import json
import re

def escape_sql_str(text: str) -> str:
    """Escapes single quotes for standard SQL strings."""
    if text is None:
        return ''
    # Replace single quote with two single quotes
    return text.replace("'", "''")

def question_to_sql_insert(q: dict, order_index: int = None) -> str:
    """Converts a question dictionary to an INSERT statement for public.questions."""
    lesson = escape_sql_str(q['lesson'])
    topic = escape_sql_str(q['topic'])
    q_type = escape_sql_str(q.get('question_type', 'multiple_choice'))
    diff = int(q.get('difficulty', 2))
    prompt = escape_sql_str(q['prompt_text'].strip())
    
    # Interaction data contains options and correctIndex
    interaction_data = {
        "options": q['options'],
        "correctIndex": q['correctIndex']
    }
    interaction_json = escape_sql_str(json.dumps(interaction_data, ensure_ascii=False))
    
    explanation = escape_sql_str(q['explanation'].strip())
    distractor_trap = escape_sql_str(q['distractor_trap'].strip())
    
    if order_index is not None:
        sql = f"""insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap,
  order_index
) values (
  '{lesson}',
  '{topic}',
  '{q_type}',
  {diff},
  '{prompt}',
  '{interaction_json}'::jsonb,
  '{explanation}',
  '{distractor_trap}',
  {order_index}
);"""
    else:
        sql = f"""insert into public.questions (
  lesson,
  topic,
  question_type,
  difficulty,
  prompt_text,
  interaction_data,
  explanation,
  distractor_trap
) values (
  '{lesson}',
  '{topic}',
  '{q_type}',
  {diff},
  '{prompt}',
  '{interaction_json}'::jsonb,
  '{explanation}',
  '{distractor_trap}'
);"""
    return sql

def validate_question(q: dict, idx: int = 0) -> None:
    required_keys = ['lesson', 'topic', 'difficulty', 'prompt_text', 'options', 'correctIndex', 'explanation', 'distractor_trap']
    for k in required_keys:
        if k not in q:
            raise ValueError(f"Question #{idx} missing key '{k}'")
    if not isinstance(q['options'], list) or len(q['options']) != 5:
        raise ValueError(f"Question #{idx} options must be a list of 5 elements. Found: {len(q.get('options', []))}")
    if q['correctIndex'] not in range(5):
        raise ValueError(f"Question #{idx} correctIndex must be between 0 and 4. Found: {q['correctIndex']}")
    if q['difficulty'] not in [1, 2, 3]:
        raise ValueError(f"Question #{idx} difficulty must be 1, 2, or 3. Found: {q['difficulty']}")
